#include "sdkconfig.h"
#ifdef CONFIG_ZCLAW_T_DISPLAY
#include <stdio.h>

#include "tools_power.h"
#include "power_tdisplay.h"
#include "cJSON.h"
#include "esp_log.h"
#include <string.h>

static const char *TAG = "tools_power";

bool tools_battery_status_handler(const cJSON *input, char *result, size_t result_len)
{
    /* Ignore input; just report battery data */
    (void)input;

    uint16_t vbat_mv = power_get_vbat_mv();
    uint8_t percent = power_get_battery_percent();
    bool usb = usb_is_powered();

    cJSON *root = cJSON_CreateObject();
    if (!root) {
        snprintf(result, result_len, "{\"error\":\"Failed to create JSON\"}");
        return false;
    }

    cJSON_AddNumberToObject(root, "voltage_mv", vbat_mv);
    cJSON_AddNumberToObject(root, "percent", percent);
    cJSON_AddBoolToObject(root, "usb_connected", usb);

    char *str = cJSON_PrintUnformatted(root);
    if (str) {
        strncpy(result, str, result_len - 1);
        result[result_len - 1] = '\0';
        cJSON_free(str);
    } else {
        snprintf(result, result_len, "{\"error\":\"JSON serialization failed\"}");
    }

    cJSON_Delete(root);
    return true;
}



bool tools_battery_raw_handler(const cJSON *input, char *result, size_t result_len) {
    (void)input;
    uint16_t raw = power_get_raw_adc();
    snprintf(result, result_len, "Battery raw ADC: %d", raw);
    return true;
}

bool tools_battery_voltage_handler(const cJSON *input, char *result, size_t result_len) {
    (void)input;
    uint16_t mv = power_get_vbat_mv();
    snprintf(result, result_len, "Battery voltage: %d mV", mv);
    return true;
}

bool tools_battery_percent_handler(const cJSON *input, char *result, size_t result_len) {
    (void)input;
    uint8_t pct = power_get_battery_percent();
    snprintf(result, result_len, "Battery: %d%%", pct);
    return true;
}
#endif // CONFIG_ZCLAW_T_DISPLAY
