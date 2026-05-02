#include "config.h"
#include "memory.h"
#include "channel.h"
#include "agent.h"
#include "llm.h"
#include "tools.h"
#include "telegram.h"
#include "cron.h"
#include "ratelimit.h"
#include "ota.h"
#include "http_gate.h"
#include "boot_guard.h"
#include "nvs_keys.h"
#include "messages.h"
#include "wifi_credentials.h"
#include "gpio_policy.h"
#ifdef CONFIG_ZCLAW_T_DISPLAY
#include "power_tdisplay.h"
#include "display_tdisplay.h"
#endif

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/event_groups.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "esp_err.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include "driver/gpio.h"
#include "esp_sleep.h"
#include <string.h>


// WiFi event group
#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT      BIT1

static bool s_safe_mode = false;
static uint8_t s_last_disconnect_reason = 0;

#ifndef WIFI_REASON_BEACON_TIMEOUT
#define WIFI_REASON_BEACON_TIMEOUT 200
#endif
#ifndef WIFI_REASON_NO_AP_FOUND
#define WIFI_REASON_NO_AP_FOUND 201
#endif
#ifndef WIFI_REASON_AUTH_FAIL
#define WIFI_REASON_AUTH_FAIL 202
#endif
#ifndef WIFI_REASON_ASSOC_FAIL
#define WIFI_REASON_ASSOC_FAIL 203
#endif
#ifndef WIFI_REASON_HANDSHAKE_TIMEOUT
#define WIFI_REASON_HANDSHAKE_TIMEOUT 204
#endif

static const char *wifi_disconnect_reason_name(uint8_t reason)
{
    switch (reason) {
