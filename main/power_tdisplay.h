#ifndef POWER_TDISPLAY_H
#define POWER_TDISPLAY_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <esp_err.h>

esp_err_t power_init(void);
uint16_t power_get_vbat_mv(void);
uint8_t power_get_battery_percent(void);
bool usb_is_powered(void);

#ifdef __cplusplus
}
#endif

#endif // POWER_TDISPLAY_H
