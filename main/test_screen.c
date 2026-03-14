//#include "tools_handlers.h"
//#include "config.h"
//#include "display_tdisplay.h"
#include "cJSON.h"
//#include <string.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include <stdio.h>
//#include "freertos/FreeRTOS.h"
//#include "freertos/task.h"

#include "sdkconfig.h"
#include "esp_system.h"
#include "esp_log.h"
//#include "driver/uart.h"
#include "esp_timer.h"
//#include <string.h>

#include "ttgo.h"

extern uint8_t bgRed, bgGreen, bgBlue;
extern uint8_t fillboxBgRed, fillboxBgGreen, fillboxBgBlue;
bool tools_test_screen_handler(const cJSON *input, char *result, size_t result_len) {

    initTTGO();
            snprintf(result, result_len, "lith on");
    char s[30];
    bgRed = 0x30;
    bgGreen = 0x40;
    bgBlue = 0xd0;
    int count = 0;
    unsigned x = 10;
    unsigned y = 10;

    vTaskDelay(50 / portTICK_PERIOD_MS);

    // Make sure the periodic display task is running so that
    // manual overlays are actually drawn on the screen.
     snprintf(s, 30, "Test ");
    x = displayStr(s, x, y, 0xff, 0x00, 0xff, 32);
           snprintf(result, result_len, "task start");

    // Use manual overlay so the normal boot/status UI (battery,
    // message, etc.) can continue to be rendered underneath.
//    display_set_manual_text(5, 5, "TEST", 0xF800);
            snprintf(result, result_len, "set etxt");
//display_show_test();
            snprintf(result, result_len, "sahow  text");
    vTaskDelay(pdMS_TO_TICKS(5000));

    // Clear the manual overlay after the test duration, but leave
    // the backlight and the main UI running.
     clearScreen(bgRed, bgGreen, bgBlue);
//    display_clear_manual();
            snprintf(result, result_len, "clear");

    snprintf(result, result_len, "Screen test completed");
    return true;
}
