#include "tools_handlers.h"
#include "config.h"
#include "display_tdisplay.h"
#include "cJSON.h"
#include <string.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len) {
    esp_err_t err = ESP_OK;
    if (!display_is_initialized()) {
        err = display_init();
        if (err != ESP_OK) {
            snprintf(result, result_len, "display_init failed: %s", esp_err_to_name(err));
            return false;
        }
    }
    display_backlight(true);
    // Use manual overlay so persistent boot message remains
    display_set_manual_text(5, 5, "TEST", 0xF800);
    vTaskDelay(pdMS_TO_TICKS(5000));
    display_clear_manual();
    // Do NOT clear display_message; leave boot message intact
    // Do NOT turn off backlight; keep it on for normal operation
    snprintf(result, result_len, "Screen test completed");
    return true;
}
