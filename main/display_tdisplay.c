#include "esp_system.h"
#ifdef CONFIG_ZCLAW_T_DISPLAY

#include "display_tdisplay.h"
#include "cJSON.h"
#include "font8x8.h"
#include "esp_log.h"
#include "driver/spi_master.h"
#include "driver/gpio.h"
#include "power_tdisplay.h"
#include "freertos/FreeRTOS.h"
#include <string.h>
#include <stdio.h>

static const char *TAG = "display_tdisplay";

// TFT pins
#define TFT_MOSI_GPIO 19
#define TFT_SCLK_GPIO 18
#define TFT_CS_GPIO 5
#define TFT_DC_GPIO 16
#define TFT_BL_GPIO 4
#define BUTTON_GPIO 0

// SPI
static spi_device_handle_t tft_spi = NULL;
static spi_host_device_t spi_host = SPI2_HOST;
static SemaphoreHandle_t spi_mutex;

// ST7789 commands
#define CMD_SWRESET 0x01
#define CMD_SLPOUT  0x11
#define CMD_DISPON  0x29
#define CMD_MADCTL  0x36
#define CMD_COLMOD  0x3A
#define CMD_CASET   0x2A
#define CMD_RASET   0x2B
#define CMD_RAMWR   0x2C

#define MADCTL_PORTRAIT 0x40
#define COLOR_MODE_16BIT 0x55

#define SPI_BUF_SIZE 1024
static uint8_t spi_tx_buf[SPI_BUF_SIZE];

static void tft_write_cmd(const uint8_t cmd)
{
    spi_transaction_t t = {0};
    t.length = 8;
    t.tx_buffer = &cmd;
    gpio_set_level(TFT_DC_GPIO, 0);
    if (xSemaphoreTake(spi_mutex, portMAX_DELAY) == pdTRUE) {
        esp_err_t ret = spi_device_polling_transmit(tft_spi, &t);
        if (ret != ESP_OK) ESP_LOGW(TAG, "cmd 0x%02x tx failed: %s", cmd, esp_err_to_name(ret));
        xSemaphoreGive(spi_mutex);
    }
}

static void tft_write_data(const uint8_t *data, size_t len)
{
    if (len == 0) return;
    spi_transaction_t t = {0};
    t.length = len * 8;
    t.tx_buffer = data;
    gpio_set_level(TFT_DC_GPIO, 1);
    if (xSemaphoreTake(spi_mutex, portMAX_DELAY) == pdTRUE) {
        esp_err_t ret = spi_device_polling_transmit(tft_spi, &t);
        if (ret != ESP_OK) ESP_LOGW(TAG, "data tx len=%d failed: %s", (int)len, esp_err_to_name(ret));
        xSemaphoreGive(spi_mutex);
    }
}

static void tft_write_data_byte(uint8_t data)
{
    tft_write_data(&data, 1);
}

static void tft_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint8_t buf[4];
    tft_write_cmd(CMD_CASET);
    buf[0] = (x0 >> 8) & 0xFF; buf[1] = x0 & 0xFF;
    buf[2] = (x1 >> 8) & 0xFF; buf[3] = x1 & 0xFF;
    tft_write_data(buf, 4);
    tft_write_cmd(CMD_RASET);
    buf[0] = (y0 >> 8) & 0xFF; buf[1] = y0 & 0xFF;
    buf[2] = (y1 >> 8) & 0xFF; buf[3] = y1 & 0xFF;
    tft_write_data(buf, 4);
    tft_write_cmd(CMD_RAMWR);
}

static void tft_fill_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (w == 0 || h == 0) return;
    tft_set_window(x, y, x + w - 1, y + h - 1);
    uint32_t total = (uint32_t)w * (uint32_t)h;
    spi_tx_buf[0] = (color >> 8) & 0xFF;
    spi_tx_buf[1] = color & 0xFF;
    size_t pos = 0;
    for (uint32_t i = 0; i < total; i++) {
        if (pos >= SPI_BUF_SIZE - 2) {
            tft_write_data(spi_tx_buf, pos);
            pos = 0;
        }
        spi_tx_buf[pos++] = spi_tx_buf[0];
        spi_tx_buf[pos++] = spi_tx_buf[1];
    }
    if (pos > 0) tft_write_data(spi_tx_buf, pos);
}

static void tft_draw_char(uint16_t x, uint16_t y, char c, uint16_t fg, uint16_t bg)
{
    if (c < 32 || c > 126) c = '?';
    int idx = c - 32;
    const uint8_t *font_row = font8x8[idx];
    for (int row = 0; row < 8; row++) {
        uint8_t bits = font_row[row];
        for (int col = 0; col < 8; col++) {
            uint16_t color = (bits & (1 << col)) ? fg : bg;
            spi_tx_buf[col*2] = (color >> 8) & 0xFF;
            spi_tx_buf[col*2+1] = color & 0xFF;
        }
        tft_set_window(x, y + row, x + 7, y + row);
        tft_write_data(spi_tx_buf, 16);
    }
}

static void tft_draw_string(uint16_t x, uint16_t y, const char *str, uint16_t fg, uint16_t bg)
{
    int cursor_x = x;
    for (int i = 0; str[i]; i++) {
        tft_draw_char(cursor_x, y, str[i], fg, bg);
        cursor_x += 8;
        if (cursor_x >= TFT_WIDTH) break;
    }
}

// Message buffer
esp_err_t display_set_message(const char *msg);

// --- Button backlight toggle state ---
static volatile bool button_enabled = true;
static volatile bool backlight_state = true; // track current state
static volatile TickType_t last_toggle_tick = 0;
static const TickType_t DEBOUNCE_MS = pdMS_TO_TICKS(50);

static void IRAM_ATTR button_isr_handler(void* arg)
{
    TickType_t now = xTaskGetTickCountFromISR();
    if ((now - last_toggle_tick) >= DEBOUNCE_MS) {
        if (button_enabled) {
            backlight_state = !backlight_state;
            gpio_set_level(TFT_BL_GPIO, backlight_state ? 1 : 0);
        }
        last_toggle_tick = now;
    }
}

void display_set_button_enabled(bool enable)
{
    // Simple mutex could be used but volatile bool is safe for single writer/reader
    button_enabled = enable;
}

// --- Display state ---
static char display_message[128] = "";

// Manual overlay (for tools)
static char manual_text[128] = "";
static int manual_x = 0, manual_y = 0;
static uint16_t manual_color = 0xFFFF;
static bool manual_present = false;
static SemaphoreHandle_t manual_mutex = NULL;
static SemaphoreHandle_t msg_mutex = NULL;

esp_err_t display_init(void)
{
    esp_err_t ret = ESP_OK;

    // SPI bus
    spi_bus_config_t buscfg = {
        .mosi_io_num = TFT_MOSI_GPIO,
        .miso_io_num = -1,
        .sclk_io_num = TFT_SCLK_GPIO,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
        .max_transfer_sz = SPI_BUF_SIZE,
        .flags = SPICOMMON_BUSFLAG_MASTER,
    };
    ret = spi_bus_initialize(spi_host, &buscfg, SPI_DMA_CH_AUTO);
    if (ret != ESP_OK && ret != ESP_ERR_INVALID_STATE) {
        ESP_LOGE(TAG, "spi_bus_initialize failed: %s", esp_err_to_name(ret));
        return ret;
    }

    spi_device_interface_config_t devcfg = {
        .command_bits = 0,
        .address_bits = 0,
        .dummy_bits = 0,
        .mode = 0,
        .duty_cycle_pos = 0,
        .cs_ena_pretrans = 0,
        .cs_ena_posttrans = 0,
        .clock_speed_hz = 40 * 1000 * 1000,
        .input_delay_ns = 0,
        .spics_io_num = TFT_CS_GPIO,
        .flags = 0,
        .queue_size = 7,
    };
    if (tft_spi == NULL) {
        ret = spi_bus_add_device(spi_host, &devcfg, &tft_spi);
        if (ret != ESP_OK) {
            ESP_LOGE(TAG, "spi_bus_add_device failed: %s", esp_err_to_name(ret));
            return ret;
        }
    }

    spi_mutex = xSemaphoreCreateMutex();
    if (!spi_mutex) return ESP_ERR_NO_MEM;
    msg_mutex = xSemaphoreCreateMutex();
    manual_mutex = xSemaphoreCreateMutex();
    if (!manual_mutex) { vSemaphoreDelete(spi_mutex); vSemaphoreDelete(msg_mutex); return ESP_ERR_NO_MEM; }
    if (!msg_mutex) { vSemaphoreDelete(spi_mutex); return ESP_ERR_NO_MEM; }

    // GPIOs for display
    gpio_config_t io_conf = {0};
    io_conf.intr_type = GPIO_INTR_DISABLE;
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pin_bit_mask = (1ULL << TFT_CS_GPIO) | (1ULL << TFT_DC_GPIO) | (1ULL << TFT_BL_GPIO);
    gpio_config(&io_conf);
    gpio_set_level(TFT_CS_GPIO, 1);
    gpio_set_level(TFT_DC_GPIO, 0);

    vTaskDelay(pdMS_TO_TICKS(20));

    // Init sequence
    tft_write_cmd(CMD_SWRESET);
    vTaskDelay(pdMS_TO_TICKS(150));
    tft_write_cmd(CMD_SLPOUT);
    vTaskDelay(pdMS_TO_TICKS(120));
    tft_write_cmd(CMD_MADCTL);
    tft_write_data_byte(MADCTL_PORTRAIT);
    tft_write_cmd(CMD_COLMOD);
    tft_write_data_byte(COLOR_MODE_16BIT);
    vTaskDelay(pdMS_TO_TICKS(10));
    tft_write_cmd(CMD_DISPON);
    vTaskDelay(pdMS_TO_TICKS(20));

    display_backlight(true);
    backlight_state = true;

    // Configure BUTTON (GPIO0) as input with pull-up
    gpio_config_t btn_conf = {0};
    btn_conf.intr_type = GPIO_INTR_NEGEDGE; // falling edge
    btn_conf.mode = GPIO_MODE_INPUT;
    btn_conf.pin_bit_mask = (1ULL << BUTTON_GPIO);
    btn_conf.pull_up_en = 1;
    btn_conf.pull_down_en = 0;
    gpio_config(&btn_conf);

    // Install ISR service and add handler
    esp_err_t err = gpio_install_isr_service(0);
    if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) {
        ESP_LOGW(TAG, "gpio_install_isr_service failed: %s", esp_err_to_name(err));
    }
    err = gpio_isr_handler_add(BUTTON_GPIO, button_isr_handler, NULL);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "gpio_isr_handler_add failed: %s", esp_err_to_name(err));
    } else {
        ESP_LOGI(TAG, "Button (GPIO%d) ISR installed for backlight toggle", BUTTON_GPIO);
    }

    ESP_LOGI(TAG, "Display initialized");
    return ESP_OK;
}

void display_clear(void)
{
    tft_fill_rect(0, 0, TFT_WIDTH, TFT_HEIGHT, 0x0000);
}

void display_text(int x, int y, const char *text, uint16_t color)
{
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    tft_draw_string(x, y, text, color, 0x0000);
}

void display_battery(int x, int y, uint8_t percent, bool charging)
{
    if (percent > 100) percent = 100;
    uint16_t bat_w = 20, bat_h = 8;
    tft_fill_rect(x, y, bat_w, bat_h, 0xFFFF);
    tft_fill_rect(x+1, y+1, bat_w-2, bat_h-2, 0x0000);
    uint8_t fill_w = (bat_w - 4) * percent / 100;
    if (fill_w > 0) {
        uint16_t fill_color = (percent < 20) ? 0xF800 : (percent < 50 ? 0xFFE0 : 0x07E0);
        tft_fill_rect(x+2, y+2, fill_w, bat_h-4, fill_color);
    }
    if (charging) {
        tft_fill_rect(x+bat_w-2, y+1, 1, 3, 0xFFFF);
        tft_fill_rect(x+bat_w-4, y+2, 3, 1, 0xFFFF);
    }
    char pct_str[5];
    snprintf(pct_str, sizeof(pct_str), "%d%%", percent);
    tft_draw_string(x+bat_w+2, y, pct_str, 0xFFFF, 0x0000);
}

void display_backlight(bool on)
{
    gpio_set_level(TFT_BL_GPIO, on ? 1 : 0);
    backlight_state = on;
}

esp_err_t display_set_message(const char *msg)
{
    if (xSemaphoreTake(msg_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        strncpy(display_message, msg, sizeof(display_message)-1);
        display_message[sizeof(display_message)-1] = '\0';
        xSemaphoreGive(msg_mutex);
        return ESP_OK;
    }
    return ESP_ERR_TIMEOUT;
}


// Manual overlay API
void display_set_manual_text(int x, int y, const char *text, uint16_t color)
{
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        manual_x = x;
        manual_y = y;
        strncpy(manual_text, text, sizeof(manual_text)-1);
        manual_text[sizeof(manual_text)-1] = ' ';
        manual_color = color;
        manual_present = true;
        xSemaphoreGive(manual_mutex);
    }
}

void display_clear_manual(void)
{
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        manual_present = false;
        xSemaphoreGive(manual_mutex);
    }
}

static void display_task(void *pvParameters)
{
    vTaskDelay(pdMS_TO_TICKS(500));
    while (1) {
        #include "power_tdisplay.h"
        uint8_t pct = power_get_battery_percent();
        bool charging = usb_is_powered();

        display_clear();
        display_battery(5, 5, pct, charging);
        // Draw manual overlay if active
        char manual_buf[128];
        bool draw_manual = false;
        if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(10)) == pdTRUE) {
            if (manual_present) {
                strncpy(manual_buf, manual_text, sizeof(manual_buf)-1);
                manual_buf[sizeof(manual_buf)-1] = ' ';
                draw_manual = true;
            }
            xSemaphoreGive(manual_mutex);
        }
        if (draw_manual) {
            display_text(manual_x, manual_y, manual_buf, manual_color);
        }


        char msg[128];
        if (xSemaphoreTake(msg_mutex, pdMS_TO_TICKS(10)) == pdTRUE) {
            strncpy(msg, display_message, sizeof(msg)-1);
            msg[sizeof(msg)-1] = '\0';
            xSemaphoreGive(msg_mutex);
        } else {
            msg[0] = '\0';
        }
        if (msg[0]) {
            display_text(5, 20, msg, 0xFFFF);
        }

        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void display_start_task(void)
{
    xTaskCreate(&display_task, "display_task", 4096, NULL, 5, NULL);
}

#endif // CONFIG_ZCLAW_T_DISPLAY

// Display tool handlers
bool tools_display_text_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *jx = cJSON_GetObjectItem(input, "x");
    cJSON *jy = cJSON_GetObjectItem(input, "y");
    cJSON *jt = cJSON_GetObjectItem(input, "text");
    if (!jx || !jy || !jt || !jt->valuestring) {
        snprintf(result, result_len, "Error: Missing required parameters x, y, or text");
        return false;
    }
    int x = jx->valueint;
    int y = jy->valueint;
    const char *text = jt->valuestring;
    uint16_t color = 0xFFFF;
    cJSON *jc = cJSON_GetObjectItem(input, "color");
    if (jc) color = (uint16_t)jc->valueint;

    display_text(x, y, text, color);
    snprintf(result, result_len, "Displayed text at (%d,%d): %s", x, y, text);
    return true;
}bool tools_display_battery_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *jx = cJSON_GetObjectItem(input, "x");
    cJSON *jy = cJSON_GetObjectItem(input, "y");
    cJSON *jp = cJSON_GetObjectItem(input, "percent");
    if (!jx || !jy || !jp) {
        snprintf(result, result_len, "Error: Missing required parameters x, y, or percent");
        return false;
    }
    int x = jx->valueint;
    int y = jy->valueint;
    int percent = jp->valueint;
    bool charging = false;
    cJSON *jc = cJSON_GetObjectItem(input, "charging");
    if (jc) charging = jc->valueint != 0;

    display_battery(x, y, (uint8_t)percent, charging);
    snprintf(result, result_len, "Displayed battery at (%d,%d): %d%% %s",
             x, y, percent, charging ? " (charging)" : "");
    return true;
}
// Tool: red (convenience tool)
bool tools_red_handler(const cJSON *input, char *result, size_t result_len) {
    (void)input; // unused
    display_set_manual_text(5, 5, "red", 0xF800);
    snprintf(result, result_len, "Set red overlay at (5,5) in color 0xF800");
    return true;
}
