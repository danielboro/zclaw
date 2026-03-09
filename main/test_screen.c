#include "display_tdisplay.h"
#include "cJSON.h"
#include "freertos/FreeRTOS.h"
#include <stdio.h>
#include <stdbool.h>

bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len)
{
    (void)input;
    display_backlight(true);
    display_set_manual_text(5, 5, "TEST", 0xF800);
    vTaskDelay(pdMS_TO_TICKS(5000));
    display_clear_manual();
    display_backlight(false);
    snprintf(result, result_len, "Test screen completed");
    return true;
}
