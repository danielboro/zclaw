#include "display_tdisplay.h"
#include "cJSON.h"
#include <string.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len) {
    display_backlight(true);
    display_set_message("TEST");
    vTaskDelay(pdMS_TO_TICKS(5000));
    display_set_message("");
    display_backlight(false);
    snprintf(result, result_len, "Screen test completed");
    return true;
}
