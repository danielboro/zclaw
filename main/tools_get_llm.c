#include "tools_handlers.h"
#include "cJSON.h"
#include "esp_log.h"

bool tools_get_llm_handler(const cJSON *input, char *result, size_t result_len) {
    // Get the current model
    const char *model = llm_get_model();
    if (model) {
        snprintf(result, result_len, "Current LLM model: %s", model);
        return true;
    }
    snprintf(result, result_len, "Error: Unable to get current LLM model");
    return false;
}
