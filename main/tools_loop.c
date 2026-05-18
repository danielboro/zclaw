#include "tools_handlers.h"
#include "cJSON.h"
#include "esp_log.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

static const char *TAG = "tools_loop";

#define MAX_LOOP_RESULT 4096

typedef bool (*tool_handler_fn)(const cJSON*, char*, size_t);

bool tools_loop_handler(const cJSON *input, char *result, size_t result_len) {
    cJSON *tool_json = cJSON_GetObjectItemCaseSensitive(input, "tool");
    cJSON *loops_json = cJSON_GetObjectItemCaseSensitive(input, "loops");
    cJSON *start_json = cJSON_GetObjectItemCaseSensitive(input, "start");
    cJSON *params_json = cJSON_GetObjectItemCaseSensitive(input, "input");
    if (!cJSON_IsString(tool_json) || !cJSON_IsNumber(loops_json)) {
        snprintf(result, result_len, "Error: 'tool' (string) and 'loops' (number) required");
        return false;
    }
    const char *tool_name = tool_json->valuestring;
    int loops = loops_json->valueint;
    int start = start_json && cJSON_IsNumber(start_json) ? start_json->valueint : 0;
    if (loops <= 0) {
        snprintf(result, result_len, "Error: loops must be > 0");
        return false;
    }
    cJSON *base_input = params_json ? cJSON_Duplicate(params_json, 1) : cJSON_CreateObject();
    if (!base_input) {
        snprintf(result, result_len, "Error: out of memory creating base input");
        return false;
    }
    // Map tool names to their handlers (must match registration in builtin_tools.def)
    struct {
        const char *name;
        tool_handler_fn fn;
    } tools[] = {
        { "gpio_write", tools_gpio_write_handler },
        { "gpio_read", tools_gpio_read_handler },
        { "delay", tools_delay_handler },
        { "display_text", tools_display_text_handler },
        { "display_battery", tools_display_battery_handler },
        { "red", tools_red_handler },
        { "set_background_color", tools_set_background_color_handler },
        { "clear_screen", tools_clear_screen_handler },
        { "screen_on", tools_screen_on_handler },
        { "screen_off", tools_screen_off_handler },
        { "test_screen", tools_test_screen_handler },
        { "sleep_timer", tools_sleep_timer_handler },
        { "sleep_gpio", tools_sleep_gpio_handler },
        { "loop", tools_loop_handler },
        // Add more as needed
    };
    tool_handler_fn target_fn = NULL;
    for (size_t i = 0; i < sizeof(tools)/sizeof(tools[0]); i++) {
        if (strcmp(tool_name, tools[i].name) == 0) {
            target_fn = tools[i].fn;
            break;
        }
    }
    if (!target_fn) {
        cJSON_Delete(base_input);
        snprintf(result, result_len, "Error: unknown tool '%s' for looping", tool_name);
        return false;
    }
    char iter_result[512];
    size_t total_len = 0;
    result[0] = '\0';
    for (int i = 0; i < loops; i++) {
        cJSON *iter_input = cJSON_Duplicate(base_input, 1);
        if (!iter_input) {
            cJSON_Delete(base_input);
            snprintf(result, result_len, "Error: out of memory duplicating input");
            return false;
        }
        cJSON *count_item = cJSON_CreateNumber(start + i);
        if (!count_item) {
            cJSON_Delete(iter_input);
            cJSON_Delete(base_input);
            snprintf(result, result_len, "Error: out of memory creating count");
            return false;
        }
        cJSON_AddItemToObject(iter_input, "count", count_item);
        iter_result[0] = '\0';
        bool ok = target_fn(iter_input, iter_result, sizeof(iter_result));
        cJSON_Delete(iter_input);
        if (total_len >= result_len) break;
        int remaining = result_len - total_len;
        char *dest = result + total_len;
        if (i > 0) {
            int n = snprintf(dest, remaining, ", ");
            total_len += n;
            remaining = result_len - total_len;
            dest = result + total_len;
        }
        if (ok) {
            int n = snprintf(dest, remaining, "[%d]: %s", start + i, iter_result);
            total_len += n;
        } else {
            int n = snprintf(dest, remaining, "[%d]: ERROR: %s", start + i, iter_result);
            total_len += n;
        }
    }
    cJSON_Delete(base_input);
    return true;
}
