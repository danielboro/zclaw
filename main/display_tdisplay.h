#ifndef DISPLAY_TDISPLAY_H
#define DISPLAY_TDISPLAY_H

#ifdef __cplusplus
extern "C" {
#endif

#include "esp_err.h"
#include <stdbool.h>
#include <stdint.h>

#define TFT_WIDTH 135
#define TFT_HEIGHT 240

esp_err_t display_init(void);
void display_clear(void);
void display_text(int x, int y, const char *text, uint16_t color);
void display_battery(int x, int y, uint8_t percent, bool charging);
void display_backlight(bool on);
void display_set_manual_text(int x, int y, const char *text, uint16_t color);
void display_clear_manual(void);
esp_err_t display_set_message(const char *msg);
void display_set_button_enabled(bool enable);
void display_start_task(void);
void display_show_test(void);

#ifdef __cplusplus
}
#endif

bool display_is_initialized(void);
#endif /* DISPLAY_TDISPLAY_H */
