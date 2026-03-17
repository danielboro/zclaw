
#include "tools_handlers.h"
#include "llm.h"
#include "esp_sleep.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include <string.h>

static const char *TAG = "tools_sleep";

bool tools_sleep_timer_handler(const cJSON *input, char *result, size_t result_len) {
    int seconds = 0;
    cJSON *seconds_json = cJSON_GetObjectItemCaseSensitive(input, "seconds");
    if (cJSON_IsNumber(seconds_json)) {
        seconds = seconds_json->valueint;
    } else {
        snprintf(result, result_len, "Error: 'seconds' number required");
        return false;
    }
    if (seconds <= 0) {
        snprintf(result, result_len, "Error: seconds must be > 0");
        return false;
    }
    ESP_LOGI(TAG, "Enabling timer wakeup after %d seconds", seconds);
    esp_sleep_enable_timer_wakeup(seconds * 1000000ULL);
    esp_deep_sleep_start();
    // Not reached
    snprintf(result, result_len, "Entering deep sleep for %d seconds", seconds);
    return true;
}

bool tools_sleep_gpio_handler(const cJSON *input, char *result, size_t result_len) {
    int gpio_num = -1;
    const char *level_str = NULL;
    cJSON *gpio_json = cJSON_GetObjectItemCaseSensitive(input, "gpio");
    if (cJSON_IsNumber(gpio_json)) {
        gpio_num = gpio_json->valueint;
    } else {
        snprintf(result, result_len, "Error: 'gpio' number required");
        return false;
    }
    cJSON *level_json = cJSON_GetObjectItemCaseSensitive(input, "level");
    if (cJSON_IsString(level_json)) {
        level_str = level_json->valuestring;
    } else {
        snprintf(result, result_len, "Error: 'level' string required (high/low)");
        return false;
    }
    if (gpio_num < 0 || gpio_num >= GPIO_NUM_MAX) {
        snprintf(result, result_len, "Error: invalid GPIO number");
        return false;
    }
    bool level_high = false;
    if (level_str && strcasecmp(level_str, "high") == 0) level_high = true;
    else if (level_str && strcasecmp(level_str, "low") == 0) level_high = false;
    else {
        snprintf(result, result_len, "Error: level must be 'high' or 'low'");
        return false;
    }
    // Configure GPIO as input for wakeup
    gpio_config_t cfg = {
        .pin_bit_mask = (1ULL << gpio_num),
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_DISABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = level_high ? GPIO_INTR_POSEDGE : GPIO_INTR_NEGEDGE,
    };
    esp_err_t err = gpio_config(&cfg);
    if (err != ESP_OK) {
        snprintf(result, result_len, "Error: gpio_config failed: %s", esp_err_to_name(err));
        return false;
    }
    ESP_LOGI(TAG, "Enabling GPIO wakeup on GPIO%d, %s edge", gpio_num, level_high ? "high->low" : "low->high");
    esp_sleep_enable_gpio_wakeup();
    esp_deep_sleep_start();
    // Not reached
    snprintf(result, result_len, "Entering deep sleep, wake on GPIO%d %s edge", gpio_num, level_str);
    return true;
}

// switchLLM - toggle between primary and fallback LLM configuration
// Switch between primary and fallback LLM
bool tools_switch_llm_handler(const cJSON *input, char *result, size_t result_len)
{
    if (!result) return false;
    
    bool previous = s_fallback_llm;
    s_fallback_llm = !s_fallback_llm;
    llm_init();
    
    snprintf(result, result_len, 
        "{\"previous\":%s,\"current\":%s,\"mode\":\"%s\"}",
        previous ? "true" : "false",
        s_fallback_llm ? "true" : "false",
        s_fallback_llm ? "fallback" : "primary");
    return true;
}
