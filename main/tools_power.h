#ifndef TOOLS_POWER_H
#define TOOLS_POWER_H

#include <stdbool.h>
#include <stddef.h>
#include "cJSON.h"

bool tools_battery_status_handler(const cJSON *input, char *result, size_t result_len);

#endif // TOOLS_POWER_H
