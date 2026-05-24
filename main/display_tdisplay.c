
#include "display_tdisplay.h"
#include "ttgo.h"
extern uint8_t bgRed, bgGreen, bgBlue;
#include "esp_log.h"
#include "driver/gpio.h"
#include "driver/ledc.h"
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
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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

    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    if (xSemaphoreTake(msg_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
        strncpy(display_message, msg, sizeof(display_message)-1);
        display_message[sizeof(display_message)-1] = '\0';
        xSemaphoreGive(msg_mutex);
        return ESP_OK;
    }
    return ESP_ERR_TIMEOUT;
}

void display_set_manual_text(int x, int y, const char *text, uint16_t color)
{
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    if (xSemaphoreTake(manual_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    int x = cJSON_IsNumber(x_json) ? x_json->valueint : 10;
    int y = cJSON_IsNumber(y_json) ? y_json->valueint : 10;
    uint8_t percent = cJSON_IsNumber(percent_json) ? (uint8_t)percent_json->valueint : power_get_battery_percent();
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
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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
        if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
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

// Draw a progress bar at (x,y) with width w and height h, filled to percent (0-100)
void display_progress_bar(int x, int y, int w, int h, int percent, uint16_t color) {
    if (percent < 0) percent = 0;
    if (percent > 100) percent = 100;
    // Convert RGB565 to 8-bit RGB for fillBox
    uint8_t r5 = (color >> 11) & 0x1F;
    uint8_t g6 = (color >> 5) & 0x3F;
    uint8_t b5 = color & 0x1F;
    uint8_t r = (r5 * 255 + 15) / 31;
    uint8_t g = (g6 * 255 + 31) / 63;
    uint8_t b = (b5 * 255 + 15) / 31;
    // Draw background (dark gray)
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
        fillBox(x, y, w, h, 32, 32, 32); // dark gray background
        // Draw filled portion
        int fill_w = (w * percent) / 100;
        if (fill_w > 0) {
            fillBox(x, y, fill_w, h, r, g, b);
        }
        xSemaphoreGive(spi_mutex);
    }
}

bool tools_display_progress_bar_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *x_json = cJSON_GetObjectItemCaseSensitive(input, "x");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *w_json = cJSON_GetObjectItemCaseSensitive(input, "w");
    cJSON *h_json = cJSON_GetObjectItemCaseSensitive(input, "h");
    cJSON *percent_json = cJSON_GetObjectItemCaseSensitive(input, "percent");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");

    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json) || !cJSON_IsNumber(w_json) ||
        !cJSON_IsNumber(h_json) || !cJSON_IsNumber(percent_json)) {
        snprintf(result, result_len, "Error: x, y, w, h, percent are required numbers");
        return false;
    }

    int x = x_json->valueint;
    int y = y_json->valueint;
    int w = w_json->valueint;
    int h = h_json->valueint;
    int percent = percent_json->valueint;
    uint16_t color = 0x07E0; // default green

    if (cJSON_IsNumber(color_json)) {
        color = (uint16_t)color_json->valueint;
    }

    if (w <= 0 || h <= 0) {
        snprintf(result, result_len, "Error: w and h must be > 0");
        return false;
    }

    display_progress_bar(x, y, w, h, percent, color);
    snprintf(result, result_len, "Progress bar drawn at (%d,%d) %dx%d, %d%%", x, y, w, h, percent);
    return true;
}

#define LEDC_TIMER          LEDC_TIMER_0
#define LEDC_MODE           LEDC_LOW_SPEED_MODE
#define LEDC_CHANNEL        LEDC_CHANNEL_0
#define LEDC_DUTY_RES       LEDC_TIMER_8_BIT
#define LEDC_FREQUENCY      5000

static bool s_ledc_initialized = false;

static void init_ledc_pwm(void) {
    if (s_ledc_initialized) return;
    ledc_timer_config_t ledc_timer = {
        .speed_mode       = LEDC_MODE,
        .timer_num        = LEDC_TIMER,
        .duty_resolution  = LEDC_DUTY_RES,
        .freq_hz          = LEDC_FREQUENCY,
        .clk_cfg          = LEDC_AUTO_CLK
    };
    ledc_timer_config(&ledc_timer);
    ledc_channel_config_t ledc_channel = {
        .speed_mode     = LEDC_MODE,
        .channel        = LEDC_CHANNEL,
        .timer_sel      = LEDC_TIMER,
        .intr_type      = LEDC_INTR_DISABLE,
        .gpio_num       = TFT_BL_GPIO,
        .duty           = 255,
        .hpoint         = 0
    };
    ledc_channel_config(&ledc_channel);
    s_ledc_initialized = true;
}

void display_set_brightness(int percent) {
    init_ledc_pwm();
    if (percent < 0) percent = 0;
    if (percent > 100) percent = 100;
    uint32_t duty = (percent * 255) / 100;
    ledc_set_duty(LEDC_MODE, LEDC_CHANNEL, duty);
    ledc_update_duty(LEDC_MODE, LEDC_CHANNEL);
    backlight_state = (percent > 0);
}

bool tools_screen_brightness_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *percent_json = cJSON_GetObjectItemCaseSensitive(input, "percent");
    if (!cJSON_IsNumber(percent_json)) {
        snprintf(result, result_len, "Error: 'percent' number required (0-100)");
        return false;
    }
    int percent = percent_json->valueint;
    if (percent < 0 || percent > 100) {
        snprintf(result, result_len, "Error: percent must be 0-100");
        return false;
    }
    display_set_brightness(percent);
    snprintf(result, result_len, "Screen brightness set to %d%%", percent);
    return true;
}

// Helper: draw a horizontal line
static void draw_hline(int x, int y, int w, uint8_t r, uint8_t g, uint8_t b) {
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
        fillBox(x, y, w, 1, r, g, b);
        xSemaphoreGive(spi_mutex);
    }
}

// Helper: draw a vertical line
static void draw_vline(int x, int y, int h, uint8_t r, uint8_t g, uint8_t b) {
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
        fillBox(x, y, 1, h, r, g, b);
        xSemaphoreGive(spi_mutex);
    }
}

void display_rect(int x, int y, int w, int h, uint16_t color, bool fill) {
    if (w <= 0 || h <= 0) return;
    uint8_t r5 = (color >> 11) & 0x1F;
    uint8_t g6 = (color >> 5) & 0x3F;
    uint8_t b5 = color & 0x1F;
    uint8_t r = (r5 * 255 + 15) / 31;
    uint8_t g = (g6 * 255 + 31) / 63;
    uint8_t b = (b5 * 255 + 15) / 31;
    if (fill) {
        if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) == pdTRUE) {
            fillBox(x, y, w, h, r, g, b);
            xSemaphoreGive(spi_mutex);
        }
    } else {
        draw_hline(x, y, w, r, g, b);
        draw_hline(x, y + h - 1, w, r, g, b);
        draw_vline(x, y, h, r, g, b);
        draw_vline(x + w - 1, y, h, r, g, b);
    }
}

bool tools_display_rect_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *x_json = cJSON_GetObjectItemCaseSensitive(input, "x");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *w_json = cJSON_GetObjectItemCaseSensitive(input, "w");
    cJSON *h_json = cJSON_GetObjectItemCaseSensitive(input, "h");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");
    cJSON *fill_json = cJSON_GetObjectItemCaseSensitive(input, "fill");

    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json) ||
        !cJSON_IsNumber(w_json) || !cJSON_IsNumber(h_json)) {
        snprintf(result, result_len, "Error: x, y, w, h are required numbers");
        return false;
    }

    int x = x_json->valueint;
    int y = y_json->valueint;
    int w = w_json->valueint;
    int h = h_json->valueint;
    uint16_t color = 0xFFFF;
    bool fill = true;

    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;
    if (cJSON_IsBool(fill_json)) fill = cJSON_IsTrue(fill_json);

    if (w <= 0 || h <= 0) {
        snprintf(result, result_len, "Error: w and h must be > 0");
        return false;
    }

    display_rect(x, y, w, h, color, fill);
    snprintf(result, result_len, "Rectangle drawn at (%d,%d) %dx%d %s", x, y, w, h, fill ? "filled" : "outline");
    return true;
}

void display_multi_text(const char **lines, int num_lines, int x, int y, int spacing, uint16_t color) {
    if (!lines || num_lines <= 0) return;
    for (int i = 0; i < num_lines; i++) {
        if (lines[i]) {
            display_set_manual_text(x, y + i * spacing, lines[i], color);
        }
    }
}

bool tools_display_multi_text_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *lines_json = cJSON_GetObjectItemCaseSensitive(input, "lines");
    cJSON *x_json = cJSON_GetObjectItemCaseSensitive(input, "x");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *spacing_json = cJSON_GetObjectItemCaseSensitive(input, "spacing");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");

    if (!cJSON_IsArray(lines_json)) {
        snprintf(result, result_len, "Error: 'lines' array of strings required");
        return false;
    }
    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json)) {
        snprintf(result, result_len, "Error: x and y numbers required");
        return false;
    }

    int x = x_json->valueint;
    int y = y_json->valueint;
    int spacing = cJSON_IsNumber(spacing_json) ? spacing_json->valueint : 12;
    uint16_t color = 0xFFFF;
    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;

    int num_lines = cJSON_GetArraySize(lines_json);
    if (num_lines <= 0 || num_lines > 20) {
        snprintf(result, result_len, "Error: lines array must have 1-20 items");
        return false;
    }

    const char *lines_arr[20];
    for (int i = 0; i < num_lines; i++) {
        cJSON *item = cJSON_GetArrayItem(lines_json, i);
        if (!cJSON_IsString(item)) {
            snprintf(result, result_len, "Error: all lines must be strings");
            return false;
        }
        lines_arr[i] = item->valuestring;
    }

    display_multi_text(lines_arr, num_lines, x, y, spacing, color);
    snprintf(result, result_len, "Displayed %d lines at (%d,%d) spacing=%d", num_lines, x, y, spacing);
    return true;
}

void display_line(int x0, int y0, int x1, int y1, uint16_t color) {
    uint8_t r5 = (color >> 11) & 0x1F;
    uint8_t g6 = (color >> 5) & 0x3F;
    uint8_t b5 = color & 0x1F;
    uint8_t r = (r5 * 255 + 15) / 31;
    uint8_t g = (g6 * 255 + 31) / 63;
    uint8_t b = (b5 * 255 + 15) / 31;

    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) != pdTRUE) return;

    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = (x0 < x1) ? 1 : -1;
    int sy = (y0 < y1) ? 1 : -1;
    int err = dx - dy;

    while (1) {
        fillBox(x0, y0, 1, 1, r, g, b);
        if (x0 == x1 && y0 == y1) break;
        int e2 = 2 * err;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 < dx) { err += dx; y0 += sy; }
    }

    xSemaphoreGive(spi_mutex);
}

bool tools_display_line_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *x0_json = cJSON_GetObjectItemCaseSensitive(input, "x0");
    cJSON *y0_json = cJSON_GetObjectItemCaseSensitive(input, "y0");
    cJSON *x1_json = cJSON_GetObjectItemCaseSensitive(input, "x1");
    cJSON *y1_json = cJSON_GetObjectItemCaseSensitive(input, "y1");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");

    if (!cJSON_IsNumber(x0_json) || !cJSON_IsNumber(y0_json) ||
        !cJSON_IsNumber(x1_json) || !cJSON_IsNumber(y1_json)) {
        snprintf(result, result_len, "Error: x0, y0, x1, y1 are required numbers");
        return false;
    }

    int x0 = x0_json->valueint;
    int y0 = y0_json->valueint;
    int x1 = x1_json->valueint;
    int y1 = y1_json->valueint;
    uint16_t color = 0xFFFF;
    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;

    display_line(x0, y0, x1, y1, color);
    snprintf(result, result_len, "Line drawn from (%d,%d) to (%d,%d)", x0, y0, x1, y1);
    return true;
}

// Simple 8x8 bitmap icons stored in flash
static const uint8_t icon_wifi[8] = {0x00, 0x3C, 0x42, 0x18, 0x24, 0x00, 0x18, 0x18};
static const uint8_t icon_battery[8] = {0x00, 0x7E, 0x42, 0x42, 0x42, 0x42, 0x7E, 0x00};
static const uint8_t icon_check[8] = {0x00, 0x01, 0x03, 0x06, 0xCC, 0x78, 0x30, 0x00};
static const uint8_t icon_cross[8] = {0x00, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0x00};
static const uint8_t icon_arrow_up[8] = {0x10, 0x38, 0x7C, 0xFE, 0x38, 0x38, 0x38, 0x00};
static const uint8_t icon_arrow_down[8] = {0x00, 0x38, 0x38, 0x38, 0xFE, 0x7C, 0x38, 0x10};

static const uint8_t *get_icon_bitmap(const char *icon_name) {
    if (strcmp(icon_name, "wifi") == 0) return icon_wifi;
    if (strcmp(icon_name, "battery") == 0) return icon_battery;
    if (strcmp(icon_name, "check") == 0) return icon_check;
    if (strcmp(icon_name, "cross") == 0) return icon_cross;
    if (strcmp(icon_name, "arrow_up") == 0) return icon_arrow_up;
    if (strcmp(icon_name, "arrow_down") == 0) return icon_arrow_down;
    return NULL;
}

void display_icon(int x, int y, const char *icon_name, uint16_t color) {
    const uint8_t *bitmap = get_icon_bitmap(icon_name);
    if (!bitmap) return;

    uint8_t r5 = (color >> 11) & 0x1F;
    uint8_t g6 = (color >> 5) & 0x3F;
    uint8_t b5 = color & 0x1F;
    uint8_t r = (r5 * 255 + 15) / 31;
    uint8_t g = (g6 * 255 + 31) / 63;
    uint8_t b = (b5 * 255 + 15) / 31;

    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) != pdTRUE) return;
    for (int row = 0; row < 8; row++) {
        uint8_t bits = bitmap[row];
        for (int col = 0; col < 8; col++) {
            if (bits & (0x80 >> col)) {
                fillBox(x + col, y + row, 1, 1, r, g, b);
            }
        }
    }
    xSemaphoreGive(spi_mutex);
}

bool tools_display_icon_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *x_json = cJSON_GetObjectItemCaseSensitive(input, "x");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *icon_json = cJSON_GetObjectItemCaseSensitive(input, "icon");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");

    if (!cJSON_IsNumber(x_json) || !cJSON_IsNumber(y_json)) {
        snprintf(result, result_len, "Error: x and y numbers required");
        return false;
    }
    if (!cJSON_IsString(icon_json)) {
        snprintf(result, result_len, "Error: icon name string required (wifi/battery/check/cross/arrow_up/arrow_down)");
        return false;
    }

    int x = x_json->valueint;
    int y = y_json->valueint;
    const char *icon_name = icon_json->valuestring;
    uint16_t color = 0xFFFF;
    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;

    if (!get_icon_bitmap(icon_name)) {
        snprintf(result, result_len, "Error: unknown icon '%s'. Available: wifi, battery, check, cross, arrow_up, arrow_down", icon_name);
        return false;
    }

    display_icon(x, y, icon_name, color);
    snprintf(result, result_len, "Icon '%s' drawn at (%d,%d)", icon_name, x, y);
    return true;
}

#include <math.h>

void display_scroll_text(const char *text, int y, int speed, uint16_t color) {
    if (!text || speed <= 0) return;
    int len = strlen(text);
    if (len == 0) return;
    int char_width = 6;
    int text_width = len * char_width;
    int screen_width = 135;
    if (text_width <= screen_width) {
        display_set_manual_text(0, y, text, color);
        return;
    }
    int total_scroll = text_width + screen_width;
    for (int offset = 0; offset < total_scroll; offset += speed) {
        int x_start = screen_width - offset;
        display_clear_manual();
        display_set_manual_text(x_start, y, text, color);
        vTaskDelay(pdMS_TO_TICKS(50));
    }
}

void display_circle(int cx, int cy, int r, uint16_t color, bool fill) {
    uint8_t r5 = (color >> 11) & 0x1F;
    uint8_t g6 = (color >> 5) & 0x3F;
    uint8_t b5 = color & 0x1F;
    uint8_t r8 = (r5 * 255 + 15) / 31;
    uint8_t g8 = (g6 * 255 + 31) / 63;
    uint8_t b8 = (b5 * 255 + 15) / 31;
    if (xSemaphoreTake(spi_mutex, pdMS_TO_TICKS(5000)) != pdTRUE) return;
    if (fill) {
        for (int dy = -r; dy <= r; dy++) {
            int dx = (int)(sqrt((double)(r * r - dy * dy)) + 0.5);
            fillBox(cx - dx, cy + dy, dx * 2, 1, r8, g8, b8);
        }
    } else {
        int x = r, y = 0;
        int d = 1 - r;
        while (x >= y) {
            fillBox(cx + x, cy + y, 1, 1, r8, g8, b8);
            fillBox(cx - x, cy + y, 1, 1, r8, g8, b8);
            fillBox(cx + x, cy - y, 1, 1, r8, g8, b8);
            fillBox(cx - x, cy - y, 1, 1, r8, g8, b8);
            fillBox(cx + y, cy + x, 1, 1, r8, g8, b8);
            fillBox(cx - y, cy + x, 1, 1, r8, g8, b8);
            fillBox(cx + y, cy - x, 1, 1, r8, g8, b8);
            fillBox(cx - y, cy - x, 1, 1, r8, g8, b8);
            y++;
            if (d < 0) d += 2 * y + 1;
            else { x--; d += 2 * (y - x) + 1; }
        }
    }
    xSemaphoreGive(spi_mutex);
}

bool tools_display_scroll_text_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *text_json = cJSON_GetObjectItemCaseSensitive(input, "text");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *speed_json = cJSON_GetObjectItemCaseSensitive(input, "speed");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");
    if (!cJSON_IsString(text_json)) { snprintf(result, result_len, "Error: 'text' string required"); return false; }
    if (!cJSON_IsNumber(y_json)) { snprintf(result, result_len, "Error: 'y' number required"); return false; }
    const char *text = text_json->valuestring;
    int y = y_json->valueint;
    int speed = cJSON_IsNumber(speed_json) ? speed_json->valueint : 2;
    uint16_t color = 0xFFFF;
    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;
    if (speed <= 0) speed = 2;
    if (speed > 20) speed = 20;
    display_scroll_text(text, y, speed, color);
    snprintf(result, result_len, "Scrolled text at y=%d speed=%d", y, speed);
    return true;
}

bool tools_display_circle_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *cx_json = cJSON_GetObjectItemCaseSensitive(input, "cx");
    cJSON *cy_json = cJSON_GetObjectItemCaseSensitive(input, "cy");
    cJSON *r_json = cJSON_GetObjectItemCaseSensitive(input, "r");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");
    cJSON *fill_json = cJSON_GetObjectItemCaseSensitive(input, "fill");
    if (!cJSON_IsNumber(cx_json) || !cJSON_IsNumber(cy_json) || !cJSON_IsNumber(r_json)) {
        snprintf(result, result_len, "Error: cx, cy, r are required numbers"); return false;
    }
    int cx = cx_json->valueint;
    int cy = cy_json->valueint;
    int r = r_json->valueint;
    uint16_t color = 0xFFFF;
    bool fill = true;
    if (cJSON_IsNumber(color_json)) color = (uint16_t)color_json->valueint;
    if (cJSON_IsBool(fill_json)) fill = cJSON_IsTrue(fill_json);
    if (r <= 0) { snprintf(result, result_len, "Error: r must be > 0"); return false; }
    display_circle(cx, cy, r, color, fill);
    snprintf(result, result_len, "Circle at (%d,%d) r=%d %s", cx, cy, r, fill ? "filled" : "outline");
    return true;
}

bool tools_display_screenshot_handler(const cJSON *input, char *result, size_t result_len) {
    snprintf(result, result_len, "Screenshot: 135x240 RGB565 framebuffer (32400 bytes). Use display_read_pixels tool for raw data.");
    return true;
}

// ── Clock Display ──────────────────────────────────────────────────────────

#include <time.h>
#include <sys/time.h>

static TaskHandle_t s_clock_task_handle = NULL;
static bool s_clock_running = false;
static int s_clock_x = 40;
static int s_clock_y = 5;
static uint16_t s_clock_color = 0xFFFF;
static bool s_clock_show_date = false;

static void clock_task(void *pvParameters) {
    char buf[32];
    while (s_clock_running) {
        time_t now;
        struct tm timeinfo;
        time(&now);
        localtime_r(&now, &timeinfo);
        if (s_clock_show_date) {
            strftime(buf, sizeof(buf), "%m/%d %H:%M:%S", &timeinfo);
        } else {
            strftime(buf, sizeof(buf), "%H:%M:%S", &timeinfo);
        }
        display_set_manual_text(s_clock_x, s_clock_y, buf, s_clock_color);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
    vTaskDelete(NULL);
}

void clock_display_start(int x, int y, uint16_t color, bool show_date) {
    if (s_clock_running) return;
    s_clock_x = x;
    s_clock_y = y;
    s_clock_color = color;
    s_clock_show_date = show_date;
    s_clock_running = true;
    xTaskCreate(clock_task, "clock", 2048, NULL, 5, &s_clock_task_handle);
}

void clock_display_stop(void) {
    s_clock_running = false;
    s_clock_task_handle = NULL;
}

bool tools_display_text_centered_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *text_json = cJSON_GetObjectItemCaseSensitive(input, "text");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");

    if (!cJSON_IsString(text_json)) {
        snprintf(result, result_len, "Error: 'text' string required");
        return false;
    }

    const char *text = text_json->valuestring;
    int y = cJSON_IsNumber(y_json) ? y_json->valueint : 116;
    uint16_t color = cJSON_IsNumber(color_json) ? (uint16_t)color_json->valueint : 0xFFFF;

    int len = strlen(text);
    int char_width = 8;
    int text_width = len * char_width;
    int screen_width = 135;
    int x = (screen_width - text_width) / 2;
    if (x < 0) x = 0;

    display_text(x, y, text, color);
    snprintf(result, result_len, "Centered text '%s' at y=%d (x=%d)", text, y, x);
    return true;
}

bool tools_display_clock_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *action_json = cJSON_GetObjectItemCaseSensitive(input, "action");
    const char *action = cJSON_IsString(action_json) ? action_json->valuestring : "start";

    if (strcasecmp(action, "stop") == 0) {
        clock_display_stop();
        snprintf(result, result_len, "Clock display stopped");
        return true;
    }

    // Default: start
    if (s_clock_running) {
        clock_display_stop();
        vTaskDelay(pdMS_TO_TICKS(1100));
    }

    cJSON *x_json = cJSON_GetObjectItemCaseSensitive(input, "x");
    cJSON *y_json = cJSON_GetObjectItemCaseSensitive(input, "y");
    cJSON *color_json = cJSON_GetObjectItemCaseSensitive(input, "color");
    cJSON *show_date_json = cJSON_GetObjectItemCaseSensitive(input, "show_date");

    int x = cJSON_IsNumber(x_json) ? x_json->valueint : 40;
    int y = cJSON_IsNumber(y_json) ? y_json->valueint : 5;
    uint16_t color = cJSON_IsNumber(color_json) ? (uint16_t)color_json->valueint : 0xFFFF;
    bool show_date = cJSON_IsBool(show_date_json) ? cJSON_IsTrue(show_date_json) : false;

    clock_display_start(x, y, color, show_date);
    snprintf(result, result_len, "Clock display started at (%d,%d) color=0x%04X show_date=%s", x, y, color, show_date ? "true" : "false");
    return true;
}
