#ifndef DISPLAY_TDISPLAY_H
#define DISPLAY_TDISPLAY_H

#ifdef __cplusplus
extern "C" {
#endif

#include "esp_err.h"

#define TFT_WIDTH  135
#define TFT_HEIGHT 240

// Initialize ST7789 display via SPI
esp_err_t display_init(void);

// Clear screen
void display_clear(void);

// Draw text at position (x,y) with color (0xFFFF=white, 0x0000=black, etc)
void display_text(int x, int y, const char *text, uint16_t color);

// Draw battery icon and percentage at position (x,y)
// percent: 0-100
// charging: if true, show charging indicator
void display_battery(int x, int y, uint8_t percent, bool charging);

// Set backlight on/off
void display_backlight(bool on);

#ifdef __cplusplus
}
#endif

#endif // DISPLAY_TDISPLAY_H
