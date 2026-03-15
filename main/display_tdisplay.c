
#include "display_tdisplay.h"
#include "ttgo.h"
extern uint8_t bgRed, bgGreen, bgBlue;
#include "esp_log.h"
#include "driver/gpio.h"
#include "power_tdisplay.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include <string.h>
#include <stdio.h>
#include <stdint.h>

static const char *TAG = "display_tdisplay";

#define BUTTON_GPIO 0
#define TFT_BL_GPIO 4

static bool s_display_initialized = false;
static bool backlight_state = false;
static bool button_enabled = true;

// Manual overlay
static int manual_x = 0, manual_y = 0;
static uint16_t manual_color = 0xFFFF;
static char manual_message[128] = {0};
static bool manual_valid = false;
static SemaphoreHandle_t msg_mutex = NULL;
static SemaphoreHandle_t manual_mutex = NULL;

// SPI mutex for ttgo.c
static SemaphoreHandle_t spi_mutex = NULL;

static void IRAM_ATTR button_isr_handler(void* arg);

esp_err_t display_init(void)
{
    if (s_display_initialized) return ESP_OK;

    spi_mutex = xSemaphoreCreateMutex();
    if (!spi_mutex) return ESP_ERR_NO_MEM;
    msg_mutex = xSemaphoreCreateMutex();
    if (!msg_mutex) { vSemaphoreDelete(spi_mutex); return ESP_ERR_NO_MEM; }
    manual_mutex = xSemaphoreCreateMutex();
    if (!manual_mutex) { vSemaphoreDelete(spi_mutex); vSemaphoreDelete(msg_mutex); return ESP_ERR_NO_MEM; }

    // Initialize ttgo display backend
    initTTGO();

    // Configure BUTTON_GPIO: input with pull-up, negative edge interrupt
    gpio_config_t io_conf = {0};
    io_conf.intr_type = GPIO_INTR_NEGEDGE;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pin_bit_mask = (1ULL << BUTTON_GPIO);
    io_conf.pull_up_en = GPIO_PULLUP_ENABLE;
    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
    gpio_config(&io_conf);

    // Install ISR service and add handler
    esp_err_t err = gpio_install_isr_service(0);
    if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) {
        ESP_LOGE(TAG, "gpio_install_isr_service failed: %s", esp_err_to_name(err));
    }
    gpio_isr_handler_add(BUTTON_GPIO, button_isr_handler, NULL);

    // Turn on backlight
    display_backlight(true);
    backlight_state = true;

    s_display_initialized = true;
    ESP_LOGI(TAG, "Display initialized");
    return ESP_OK;
}

void display_clear(void)
{
    if (!s_display_initialized) return;
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        clearScreen(0, 0, 0);
        xSemaphoreGive(spi_mutex);
    } else {
        ESP_LOGW(TAG, "display_clear: timeout taking spi_mutex");
    }
}

void display_text(int x, int y, const char *text, uint16_t color)
{
    if (!s_display_initialized) return;
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    uint8_t r, g, b;
    uint16_t r5 = (color >> 11) & 0x1F;
    uint16_t g6 = (color >> 5) & 0x3F;
    uint16_t b5 = color & 0x1F;
    r = (r5 * 255 + 15) / 31;
    g = (g6 * 255 + 31) / 63;
    b = (b5 * 255 + 15) / 31;
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        displayStr((char*)text, x, y, r, g, b, 32);
        xSemaphoreGive(spi_mutex);
    } else {
        ESP_LOGW(TAG, "display_text: timeout taking spi_mutex");
    }
}

void display_battery(int x, int y, uint8_t percent, bool charging)
{
    if (!s_display_initialized) return;
    if (percent > 100) percent = 100;
    uint16_t bat_w = 20, bat_h = 8;
    uint8_t r, g, b;
    uint16_t fill_color = (percent < 20) ? 0xF800 : (percent < 50 ? 0xFFE0 : 0x07E0);
    uint16_t r5 = (fill_color >> 11) & 0x1F;
    uint16_t g6 = (fill_color >> 5) & 0x3F;
    uint16_t b5 = fill_color & 0x1F;
    r = (r5 * 255 + 15) / 31;
    g = (g6 * 255 + 31) / 63;
    b = (b5 * 255 + 15) / 31;

    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        // border (white)
        fillBox(x, y, bat_w, bat_h, 255, 255, 255);
        // inner background (black)
        fillBox(x+1, y+1, bat_w-2, bat_h-2, 0, 0, 0);
        // fill
        uint16_t fill_w = (bat_w-4) * percent / 100;
        if (fill_w > 0) {
            fillBox(x+2, y+2, fill_w, bat_h-4, r, g, b);
        }
        // charging indicator (two small bars on right)
        if (charging) {
            fillBox(x+bat_w-2, y+1, 1, 3, 255, 255, 255);
            fillBox(x+bat_w-4, y+2, 3, 1, 255, 255, 255);
        }
        xSemaphoreGive(spi_mutex);
    } else {
        ESP_LOGW(TAG, "display_battery: timeout taking spi_mutex");
    }

    // percentage text using wrapper
    char pct_str[5];
    snprintf(pct_str, sizeof(pct_str), "%d%%", percent);
    display_text(x+bat_w+2, y, pct_str, 0xFFFF);
}

void display_backlight(bool on)
{
    gpio_set_level(TFT_BL_GPIO, on ? 1 : 0);
    backlight_state = on;
}

static char display_message[64] = {0};

esp_err_t display_set_message(const char *msg)
{
    if (!msg) return ESP_ERR_INVALID_ARG;
    if (xSemaphoreTake(msg_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        strncpy(display_message, msg, sizeof(display_message)-1);
        display_message[sizeof(display_message)-1] = '\0';
        xSemaphoreGive(msg_mutex);
        return ESP_OK;
    }
    return ESP_ERR_TIMEOUT;
}

void display_set_manual_text(int x, int y, const char *text, uint16_t color)
{
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        manual_x = x;
        manual_y = y;
        manual_color = color;
        strncpy(manual_message, text, sizeof(manual_message)-1);
        manual_message[sizeof(manual_message)-1] = '\0';
        manual_valid = true;
        xSemaphoreGive(manual_mutex);
    }
}

void display_set_manual_xy(int x, int y)
{
    manual_x = x;
    manual_y = y;
}

void display_clear_manual(void)
{
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        manual_valid = false;
        xSemaphoreGive(manual_mutex);
    }
}

void display_set_button_enabled(bool enable)
{
    button_enabled = enable;
}

bool display_is_initialized(void)
{
    return s_display_initialized;
}

static void manual_draw_task(void *param)
{
    char buf[128];
    for (;;) {
        vTaskDelay(pdMS_TO_TICKS(100));
        if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(10)) == pdTRUE) {
            if (manual_valid) {
                strncpy(buf, manual_message, sizeof(buf)-1);
                buf[sizeof(buf)-1] = '\0';
                int mx = manual_x, my = manual_y;
                uint16_t col = manual_color;
                xSemaphoreGive(manual_mutex);
                display_text(mx, my, buf, col);
            } else {
                xSemaphoreGive(manual_mutex);
            }
        }
    }
}

void display_start_task(void)
{
    static bool started = false;
    if (!started) {
        xTaskCreate(manual_draw_task, "display_manual", 2048, NULL, 5, NULL);
        started = true;
    }
}

void display_show_test(void)
{
    if (!display_is_initialized()) {
        display_init();
    }
    display_clear();
    display_text(5, 5, "TEST", 0xFFFF);
}

static void IRAM_ATTR button_isr_handler(void* arg)
{
    static uint32_t last = 0;
    uint32_t now = xTaskGetTickCountFromISR();
    if (now - last < 10) return;
    last = now;
    if (!button_enabled) return;
    backlight_state = !backlight_state;
    gpio_set_level(TFT_BL_GPIO, backlight_state ? 1 : 0);
}

// Tool handlers for built-in display tools
#include "cJSON.h"

bool tools_display_text_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    cJSON *x_json = cJSON_GetObjectItem(input, "x");
    cJSON *y_json = cJSON_GetObjectItem(input, "y");
    cJSON *text_json = cJSON_GetObjectItem(input, "text");
    cJSON *color_json = cJSON_GetObjectItem(input, "color");
    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json) || !cJSON_IsString(text_json)) {
        snprintf(result, result_len, "Missing or invalid parameters: need x, y, text");
        return false;
    }
    int x = x_json->valueint;
    int y = y_json->valueint;
    const char *text = text_json->valuestring;
    uint16_t color = color_json ? (uint16_t)color_json->valueint : 0xFFFF;
    display_text(x, y, text, color);
    snprintf(result, result_len, "Displayed text at (%d,%d): %s", x, y, text);
    return true;
}

bool tools_display_battery_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    cJSON *x_json = cJSON_GetObjectItem(input, "x");
    cJSON *y_json = cJSON_GetObjectItem(input, "y");
    cJSON *percent_json = cJSON_GetObjectItem(input, "percent");
    cJSON *charging_json = cJSON_GetObjectItem(input, "charging");
    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json) || !cJSON_IsNumber(percent_json)) {
        snprintf(result, result_len, "Missing or invalid parameters: need x, y, percent");
        return false;
    }
    int x = x_json->valueint;
    int y = y_json->valueint;
    uint8_t percent = (uint8_t)percent_json->valueint;
    bool charging = charging_json ? cJSON_IsTrue(charging_json) : false;
    display_battery(x, y, percent, charging);
    snprintf(result, result_len, "Battery icon at (%d,%d): %d%%%s", x, y, percent, charging ? " (charging)" : "");
    return true;
}

bool tools_red_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    display_text(5, 5, "red", 0xF800);
    snprintf(result, result_len, "Displayed 'red' in red at (5,5)");
    return true;
}



// Screen control tool handlers
bool tools_set_background_color_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    cJSON *color_json = cJSON_GetObjectItem(input, "color");
    if (!cJSON_IsNumber(color_json)) {
        snprintf(result, result_len, "Missing or invalid parameter: color (RGB565 integer)");
        return false;
    }
    uint16_t color = (uint16_t)color_json->valueint;
    uint16_t r5 = (color >> 11) & 0x1F;
    uint16_t g6 = (color >> 5) & 0x3F;
    uint16_t b5 = color & 0x1F;
    uint8_t r = (r5 * 255 + 15) / 31;
    uint8_t g = (g6 * 255 + 31) / 63;
    uint8_t b = (b5 * 255 + 15) / 31;
    bgRed = r;
    bgGreen = g;
    bgBlue = b;
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        clearScreen(r, g, b);
        xSemaphoreGive(spi_mutex);
    } else {
        snprintf(result, result_len, "Set background color but failed to lock SPI for clear");
        return false;
    }
    snprintf(result, result_len, "Background color set to 0x%04X and screen cleared", color);
    return true;
}

bool tools_clear_screen_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    cJSON *color_json = cJSON_GetObjectItem(input, "color");
    uint16_t r = bgRed, g = bgGreen, b = bgBlue;
    if (cJSON_IsNumber(color_json)) {
        uint16_t color = (uint16_t)color_json->valueint;
        uint16_t r5 = (color >> 11) & 0x1F;
        uint16_t g6 = (color >> 5) & 0x3F;
        uint16_t b5 = color & 0x1F;
        r = (r5 * 255 + 15) / 31;
        g = (g6 * 255 + 31) / 63;
        b = (b5 * 255 + 15) / 31;
    }
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        clearScreen(r, g, b);
        xSemaphoreGive(spi_mutex);
    } else {
        snprintf(result, result_len, "Clear screen failed: timeout taking spi_mutex");
        return false;
    }
    snprintf(result, result_len, "Screen cleared");
    return true;
}

bool tools_screen_on_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    display_backlight(true);
    snprintf(result, result_len, "Screen backlight turned ON (GPIO4 high)");
    return true;
}

bool tools_screen_off_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }
    display_backlight(false);
    snprintf(result, result_len, "Screen backlight turned OFF (GPIO4 low)");
    return true;
}



// Enhanced screen test tool: draws a comprehensive test pattern while preserving boot UI
bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!input || !result) return false;
    if (display_init() != ESP_OK) {
        snprintf(result, result_len, "Display not available");
        return false;
    }

    // Ensure manual overlay task is running
    display_start_task();

    // Turn on backlight if it was off
    bool was_backlight_on = backlight_state;
    if (!was_backlight_on) {
        display_backlight(true);
    }

    // Set background to dark blue (RGB565 = 0x001D? Actually 0x001D is blue? Let's compute: R=0, G=0x19, B=0x1F -> 0x001F? Use nice dark blue: R=0x00, G=0x00, B=0x1F -> RGB565 = 0x001F)
    // But our set_background_color expects RGB565. We'll set bg globals and clear manually.
    bgRed = 0; bgGreen = 0; bgBlue = 31; // dark blue
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
        clearScreen(0, 0, 31);
        xSemaphoreGive(spi_mutex);
    }

    // Draw test pattern using the normal display_text/battery API, all on manual overlay so boot message remains underneath
    // Title
    display_set_manual_text(5, 5, "T-Display Test", 0xFFFF); // white

    // Color bar samples
    uint16_t colors[] = {0xF800, 0x07E0, 0x001F, 0xFFE0, 0xF81F, 0x07FF, 0xFFFF};
    const char *color_names[] = {"Red", "Green", "Blue", "Yellow", "Magenta", "Cyan", "White"};
    int y = 20;
    for (int i = 0; i < 7; i++) {
        uint16_t c = colors[i];
        uint8_t r5 = (c >> 11) & 0x1F;
        uint8_t g6 = (c >> 5) & 0x3F;
        uint8_t b5 = c & 0x1F;
        uint8_t r = (r5 * 255 + 15) / 31;
        uint8_t g = (g6 * 255 + 31) / 63;
        uint8_t b = (b5 * 255 + 15) / 31;
        if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(100)) == pdTRUE) {
            fillBox(5 + i*16, y, 14, 10, r, g, b);
            xSemaphoreGive(spi_mutex);
        }
        char buf[16];
        snprintf(buf, sizeof(buf), "%s", color_names[i]);
        display_set_manual_text(5 + i*16, y+12, buf, 0xFFFF);
    }

    // Battery samples at various levels
    display_set_manual_text(5, 45, "Battery test:", 0xFFFF);
    display_battery(5, 55, 100, false); // 100%
    display_battery(30, 55, 50, false);  // 50%
    display_battery(55, 55, 20, true);   // 20% charging
    display_battery(80, 55, 5, false);   // 5% low

    // Text rendering test
    display_set_manual_text(5, 75, "The quick brown fox", 0x07E0); // green
    display_set_manual_text(5, 87, "jumps over 13 lazy dogs.", 0xF800); // red
    display_set_manual_text(5, 99, "1234567890", 0xFFFF); // white

    vTaskDelay(pdMS_TO_TICKS(5000));

    // Clear only manual overlay, leave boot UI and backlight as-is
    display_clear_manual();

    snprintf(result, result_len, "Screen test completed");
    return true;
}
