#include "sdkconfig.h"
#ifdef CONFIG_ZCLAW_T_DISPLAY

#include "power_tdisplay.h"
#include "esp_log.h"
#include "driver/gpio.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_adc/adc_cali.h"
#include "esp_adc/adc_cali_scheme.h"
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"

static const char *TAG = "power_tdisplay";

#define BATTERY_ADC_CHANNEL ADC_CHANNEL_6
#define BATTERY_ADC_UNIT ADC_UNIT_1
#define BATTERY_ADC_ATTEN ADC_ATTEN_DB_12
#define BATTERY_EMA_ALPHA 0.3f

static adc_oneshot_unit_handle_t adc1_handle = NULL;
static adc_cali_handle_t adc1_cali_handle = NULL;
static float ema_voltage = 0.0f;
static SemaphoreHandle_t adc_mutex;

static esp_err_t adc_cali_init(void)
{
    esp_err_t ret = ESP_FAIL;
    adc_cali_line_fitting_config_t cali_config = {
        .unit_id = BATTERY_ADC_UNIT,
        .atten = BATTERY_ADC_ATTEN,
        .bitwidth = ADC_BITWIDTH_DEFAULT,
    };
    ret = adc_cali_create_scheme_line_fitting(&cali_config, &adc1_cali_handle);
    if (ret != ESP_OK) {
        ESP_LOGW(TAG, "ADC calibration not available, using raw scaling");
        adc1_cali_handle = NULL;
    }
    return ret;
}

esp_err_t power_init(void)
{
    esp_err_t ret = ESP_OK;
    adc_oneshot_unit_init_cfg_t init_cfg = {
        .unit_id = BATTERY_ADC_UNIT,
    };

    /* Create ADC oneshot handle */
    ret = adc_oneshot_new_unit(&init_cfg, &adc1_handle);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "adc_oneshot_new_unit failed");
        return ret;
    }

    /* Configure ADC channel */
    adc_oneshot_chan_cfg_t chan_cfg = {
        .atten = BATTERY_ADC_ATTEN,
        .bitwidth = ADC_BITWIDTH_DEFAULT,
    };
    ret = adc_oneshot_config_channel(adc1_handle, BATTERY_ADC_CHANNEL, &chan_cfg);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "adc_oneshot_config_channel failed");
        adc_oneshot_del_unit(adc1_handle);
        adc1_handle = NULL;
        return ret;
    }

    /* Initialize calibration */
    adc_cali_init();

    adc_mutex = xSemaphoreCreateMutex();
    if (!adc_mutex) {
        ESP_LOGE(TAG, "Failed to create ADC mutex");
        adc_oneshot_del_unit(adc1_handle);
        adc1_handle = NULL;
        return ESP_ERR_NO_MEM;
    }

    ESP_LOGI(TAG, "Power ADC initialized");
    return ESP_OK;
}

static uint16_t read_raw_adc(void)
{
    int raw = 0;
    if (adc1_handle) {
        if (xSemaphoreTake(adc_mutex, pdMS_TO_TICKS(1000)) == pdTRUE) {
            esp_err_t r = adc_oneshot_read(adc1_handle, BATTERY_ADC_CHANNEL, &raw);
            if (r != ESP_OK) {
                raw = -1;
            }
            xSemaphoreGive(adc_mutex);
        } else {
            raw = -1;
        }
    }
    return (uint16_t)raw;
}

uint16_t power_get_vbat_mv(void)
{
    int raw = read_raw_adc();
    if (raw < 0) {
        return 0;
    }

    int voltage_mv = 0;
    if (adc1_cali_handle) {
        esp_err_t r = adc_cali_raw_to_voltage(adc1_cali_handle, raw, &voltage_mv);
        if (r != ESP_OK) {
            voltage_mv = (raw * 3300) / 4095; // fallback
        }
    } else {
        voltage_mv = (raw * 3300) / 4095;
    }

    float v = (float)voltage_mv;
    if (ema_voltage > 0.0f) {
        ema_voltage = (BATTERY_EMA_ALPHA * v) + ((1.0f - BATTERY_EMA_ALPHA) * ema_voltage);
    } else {
        ema_voltage = v;
    }

    return (uint16_t)(ema_voltage * 2.0f); // voltage divider ratio 2:1
}

uint8_t power_get_battery_percent(void)
{
    uint16_t vbat = power_get_vbat_mv();
    if (vbat > 4000) return 100;
    if (vbat > 3800) return 80;
    if (vbat > 3600) return 60;
    if (vbat > 3400) return 40;
    if (vbat > 3200) return 20;
    return 0;
}

bool usb_is_powered(void)
{
    uint16_t vbat = power_get_vbat_mv();
    return (vbat < 1000) || (vbat > 4150);
}

#endif // CONFIG_ZCLAW_T_DISPLAY
