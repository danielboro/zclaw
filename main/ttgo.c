#include <string.h>
#include "esp_log.h"
#include "driver/gpio.h"
#include "fonts.h"
#include "ttgo.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static const char *TAG = "TTGO";

uint8_t bgRed, bgGreen,  bgBlue;
uint8_t fillboxBgRed, fillboxBgGreen, fillboxBgBlue;




uint8_t previousPxRed;
uint8_t previousPxGreen;
uint8_t previousPxBlue;
uint8_t pxCount = 0;




void printValues(int header)
{
    if (header)
        printf("DC_ SDA CLK RST CS_\n");
    else
        printf("%d   %d   %d   %d   %d\n", gpio_get_level(DC_GPIO), gpio_get_level(SDA_GPIO), gpio_get_level(CLK_GPIO), gpio_get_level(RST_GPIO), gpio_get_level(CS_GPIO));
}








































































































































































































void clearScreen(uint8_t pxRed, uint8_t pxGreen, uint8_t pxBlue) {
    // Stub implementation
}

void fillBox(unsigned x, unsigned y, unsigned w, unsigned h, uint8_t pxRed, uint8_t pxGreen, uint8_t pxBlue) {
    // Stub implementation
}

void fillBox2(unsigned x, unsigned y, unsigned w, unsigned h, uint8_t pxRed, uint8_t pxGreen, uint8_t pxBlue, uint8_t * data, int headPtr) {
    // Stub implementation
}

unsigned displayStr(char *str, unsigned x, unsigned y, uint8_t pxRed, uint8_t pxGreen, uint8_t pxBlue, uint8_t size) {
    // Stub implementation
    return 0;
}

void initTTGO() {
    // Stub implementation
}
