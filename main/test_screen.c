#include "tools_handlers.h"
#include "config.h"
#include "display_tdisplay.h"
#include "cJSON.h"
#include <string.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len) {
    esp_err_t err = display_init();
    if (err != ESP_OK) {
        snprintf(result, result_len, "display_init failed: %s", esp_err_to_name(err));
        return false;
    }
    display_backlight(true);
    display_set_message("TEST");
    vTaskDelay(pdMS_TO_TICKS(5000));
    display_set_message("");
    display_backlight(false);
    snprintf(result, result_len, "Screen test completed");
    return true;
}
