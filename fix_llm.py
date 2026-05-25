import re
with open("main/llm.c", "r") as f:
    content = f.read()
# Add prototype after the last #include that contains .h
lines = content.split("\n")
last_include_idx = -1
for i, line in enumerate(lines):
    if line.strip().startswith("#include") and ".h" in line:
        last_include_idx = i
if last_include_idx == -1:
    # Fallback: insert at the top
    lines.insert(0, "bool llm_toggle_fallback(void);")
else:
    # Insert after the last include line
    lines.insert(last_include_idx + 1, "bool llm_toggle_fallback(void);")
content = "\n".join(lines)
# Add function definition after llm_get_api_key function (outside)
lines = content.split("\n")
new_lines = []
i = 0
while i < len(lines):
    line = lines[i]
    new_lines.append(line)
    if line.strip() == "return s_api_key;":
        # Skip any empty lines after this
        j = i + 1
        while j < len(lines) and lines[j].strip() == "":
            j += 1
        # Insert the function definition before lines[j]
        toggle = ["", "bool llm_toggle_fallback(void)", "{", "    s_fallback_llm = !s_fallback_llm;", "    ESP_LOGI(TAG, \"Toggled fallback LLM: %s\", s_fallback_llm ? \"enabled\" : \"disabled\");", "    return s_fallback_llm;", "}", ""]
        new_lines.extend(toggle)
        i = j - 1
    i += 1
content = "\n".join(new_lines)
# Modify error handling blocks in llm_request
# API error block: if (status != 200) { ... }
api_error_pattern = r"if \(status != 200\) \{\n\s+ESP_LOGE\(TAG, \"API error: %s\", response_buf\);\n\s+\}"
api_error_replacement = "if (status != 200) {\n         ESP_LOGE(TAG, \"API error: %s\", response_buf);\n         llm_toggle_fallback();\n     }"
content = re.sub(api_error_pattern, api_error_replacement, content)
# HTTP request error block: } else { ... }
http_error_pattern = r"\} else \{\n\s+ESP_LOGE\(TAG, \"HTTP request failed: %s\", esp_err_to_name\(err\)\);\n\s+\}"
http_error_replacement = "} else {\n         ESP_LOGE(TAG, \"HTTP request failed: %s\", esp_err_to_name(err));\n         llm_toggle_fallback();\n     }"
content = re.sub(http_error_pattern, http_error_replacement, content)
with open("main/llm.c", "w") as f:
    f.write(content)
print("Changes applied to llm.c.")
