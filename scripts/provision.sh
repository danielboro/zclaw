#!/bin/bash
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
# Provision runtime credentials into NVS (no web setup required).
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
set -e
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PORT=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
WIFI_SSID=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
WIFI_PASS=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
BACKEND=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
MODEL=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
API_KEY=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
API_URL=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
FALLBACK_BACKEND=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
FALLBACK_MODEL=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
FALLBACK_API_KEY=
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
FALLBACK_API_URL=
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
TG_TOKEN=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
TG_CHAT_IDS=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
ASSUME_YES=false
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
VERIFY_API_KEY=true
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PRINT_DETECTED_SSID=false
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
WIFI_SSID_MAX_LEN=32
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
WIFI_PASS_MAX_LEN=63
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
WIFI_PASS_MIN_LEN=8
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
usage() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    cat << EOF
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
Usage: $0 [options]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
Options:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --port <serial-port>      Serial port (auto-detect if omitted)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --ssid <wifi-ssid>        WiFi SSID (auto-detected when possible)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --pass <wifi-pass>        WiFi password (optional)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --backend <provider>      anthropic | openai | openrouter | ollama
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --model <model-id>        Model ID (defaults by backend)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --api-key <key>           LLM API key (required for anthropic/openai/openrouter)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --api-url <url>           Optional custom API endpoint URL
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --fallback-url <url>         Fallback LLM URL (default: from sdkconfig)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --fallback-model <model>       Fallback model name
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --tg-token <token>        Telegram bot token (optional)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --tg-chat-id <id[,id...]> Telegram chat ID allowlist (optional)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --tg-chat-ids <list>      Alias of --tg-chat-id
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --yes                     Non-interactive (requires --api-key except ollama; SSID auto-detect if possible)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --skip-api-check          Skip live API key verification step
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  --print-detected-ssid     Print detected host WiFi SSID and exit (test/troubleshooting helper)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
  -h, --help                Show help
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
EOF
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
detect_serial_ports() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local ports=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local os_name
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    os_name="$(uname -s)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    shopt -s nullglob
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$os_name" = "Darwin" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ports+=(/dev/cu.usbserial-*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ports+=(/dev/cu.usbmodem*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "${#ports[@]}" -eq 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ports+=(/dev/tty.usbserial-*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ports+=(/dev/tty.usbmodem*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ports+=(/dev/ttyUSB*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ports+=(/dev/ttyACM*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    shopt -u nullglob
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local p
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    for p in "${ports[@]}"; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        [ -e "$p" ] && echo "$p"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
normalize_serial_port() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local port="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local callout_port
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$port" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        /dev/tty.usb*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            callout_port="/dev/cu.${port#/dev/tty.}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ -e "$callout_port" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "$callout_port"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                return
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "$port"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
is_placeholder_ssid() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local ssid="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$ssid" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "<redacted>"|"<hidden>"|"[hidden]"|"***")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
select_serial_port() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local candidates=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local p
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    while IFS= read -r p; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        [ -n "$p" ] && candidates+=("$p")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done < <(detect_serial_ports)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "${#candidates[@]}" -eq 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "${#candidates[@]}" -eq 1 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        PORT="${candidates[0]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Auto-detected serial port: $PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Multiple serial ports detected:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local i
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    for ((i = 0; i < ${#candidates[@]}; i++)); do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  $((i + 1)). ${candidates[$i]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -t 0 ] && [ "$ASSUME_YES" != true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Select device [1-${#candidates[@]}]: " choice
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#candidates[@]}" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            PORT="${candidates[$((choice - 1))]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Using selected serial port: $PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Invalid selection."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    PORT="${candidates[0]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Non-interactive shell; defaulting to first detected port: $PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
detect_host_wifi_ssid() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local ssid=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "${ZCLAW_WIFI_SSID:-}" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if ! is_placeholder_ssid "$ZCLAW_WIFI_SSID"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "$ZCLAW_WIFI_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$(uname -s)" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        Darwin)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            # Deprecated, but still present on current macOS and often the most direct.
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ -x "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                ssid="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | sed -nE 's/^[[:space:]]*SSID:[[:space:]]*(.+)$/\1/p' | head -1)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                if [ -n "$ssid" ] && ! is_placeholder_ssid "$ssid"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    echo "$ssid"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            # Fallback that works in some shells where networksetup/scutil is restricted.
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if command -v system_profiler >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                ssid="$(system_profiler SPAirPortDataType 2>/dev/null | awk '
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    /Current Network Information:/ {in_block=1; next}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    in_block && /^[[:space:]]+[[:graph:]].*:$/ {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        line=$0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        sub(/^[[:space:]]+/, "", line)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        sub(/:$/, "", line)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        print line
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        exit
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    in_block && /^$/ {in_block=0}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                ' | head -1)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                if [ -n "$ssid" ] && ! is_placeholder_ssid "$ssid"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    echo "$ssid"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if command -v networksetup >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                local dev
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                while IFS= read -r dev; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    [ -n "$dev" ] || continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    ssid="$(networksetup -getairportnetwork "$dev" 2>/dev/null | sed -nE 's/^Current Wi-Fi Network: (.*)$/\1/p')"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    if [ -n "$ssid" ] && ! is_placeholder_ssid "$ssid"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        echo "$ssid"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                done < <(
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    networksetup -listallhardwareports 2>/dev/null | awk '
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        /^Hardware Port: Wi-Fi$/ { getline; if ($1 == "Device:") print $2 }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        /^Hardware Port: AirPort$/ { getline; if ($1 == "Device:") print $2 }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    '
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                )
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        Linux)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if command -v nmcli >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                ssid="$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes" {print $2; exit}')"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                if [ -n "$ssid" ] && ! is_placeholder_ssid "$ssid"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    echo "$ssid"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if command -v iwgetid >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                ssid="$(iwgetid -r 2>/dev/null || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                if [ -n "$ssid" ] && ! is_placeholder_ssid "$ssid"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    echo "$ssid"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
validate_wifi_ssid_length() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local ssid_len
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    ssid_len="$(LC_ALL=C printf '%s' "$WIFI_SSID" | wc -c | tr -d '[:space:]')"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ssid_len" -eq 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: WiFi SSID is required"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ssid_len" -gt "$WIFI_SSID_MAX_LEN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: WiFi SSID must be at most ${WIFI_SSID_MAX_LEN} bytes (got ${ssid_len})."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
validate_wifi_password_length() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local pass_len
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    pass_len="$(LC_ALL=C printf '%s' "$WIFI_PASS" | wc -c | tr -d '[:space:]')"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$pass_len" -eq 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$pass_len" -gt "$WIFI_PASS_MAX_LEN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  Error: password exceeds ${WIFI_PASS_MAX_LEN} bytes."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$pass_len" -lt "$WIFI_PASS_MIN_LEN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  Error: password must be ${WIFI_PASS_MIN_LEN}-${WIFI_PASS_MAX_LEN} bytes, or empty for open network."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
check_wifi_credentials() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local current_ssid
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local warnings=0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local confirm
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "WiFi credentials check:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "  SSID: $WIFI_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$WIFI_PASS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  Password: $WIFI_PASS"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if ! validate_wifi_password_length; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [[ "$WIFI_PASS" =~ ^[[:space:]] || "$WIFI_PASS" =~ [[:space:]]$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "  Warning: password has leading or trailing whitespace."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            warnings=1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  Password: (empty/open network)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    current_ssid="$(detect_host_wifi_ssid || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$current_ssid" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "$current_ssid" = "$WIFI_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "  Host WiFi: connected to '$current_ssid'"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "  Warning: host is connected to '$current_ssid' (not '$WIFI_SSID')."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            warnings=1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  Warning: could not detect current host WiFi network."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        warnings=1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "$warnings" -ne 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "  Continuing in --yes mode despite WiFi warnings."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    read -r -p "Use these WiFi credentials? [Y/n] " confirm
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    confirm="${confirm:-Y}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    [[ "$confirm" =~ ^[Yy]$ ]]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
prompt_wifi_password() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local confirm
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    while true; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "WiFi password (visible; leave blank for open network): " WIFI_PASS
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Entered WiFi password: ${WIFI_PASS:-<empty>}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Use this password? [Y/n] " confirm
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        confirm="${confirm:-Y}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
source_idf_env() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local candidates=(
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "$HOME/esp/esp-idf/export.sh"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "$HOME/esp/v5.4/esp-idf/export.sh"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    )
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "${IDF_PATH:-}" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        candidates+=("$IDF_PATH/export.sh")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local script
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local found=0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    for script in "${candidates[@]}"; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        [ -f "$script" ] || continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        found=1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if source "$script" > /dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ -z "${IDF_PATH:-}" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                IDF_PATH="$(cd "$(dirname "$script")" && pwd)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$found" -eq 1 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: ESP-IDF found but failed to activate."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Run:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  cd ~/esp/esp-idf && ./install.sh esp32,esp32c3,esp32c6,esp32s3"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: ESP-IDF not found"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
default_model_for_backend() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$1" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        anthropic) echo "claude-sonnet-4-6" ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openai) echo "gpt-5.4" ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openrouter) echo "openrouter/auto" ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ollama) echo "qwen3:8b" ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        *) echo "claude-sonnet-4-6" ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
MODEL_MENU_LABELS=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
MODEL_MENU_VALUES=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
load_model_menu_for_backend() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    MODEL_MENU_LABELS=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    MODEL_MENU_VALUES=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$1" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        anthropic)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_LABELS=("claude-sonnet-4-6 (default)" "claude-haiku-4-5" "claude-opus-4-6" "Other model ID")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_VALUES=("claude-sonnet-4-6" "claude-haiku-4-5" "claude-opus-4-6" "__custom__")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openai)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_LABELS=("gpt-5.4 (default)" "gpt-5-mini" "gpt-4.1-mini" "Other model ID")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_VALUES=("gpt-5.4" "gpt-5-mini" "gpt-4.1-mini" "__custom__")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openrouter)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_LABELS=("openrouter/auto (default)" "openai/gpt-5.2" "openai/gpt-5-mini" "anthropic/claude-sonnet-4.6" "anthropic/claude-haiku-4.5" "Other model ID")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_VALUES=("openrouter/auto" "openai/gpt-5.2" "openai/gpt-5-mini" "anthropic/claude-sonnet-4.6" "anthropic/claude-haiku-4.5" "__custom__")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ollama)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_LABELS=("qwen3:8b (default)" "Other model ID")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_VALUES=("qwen3:8b" "__custom__")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        *)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_LABELS=("Other model ID")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL_MENU_VALUES=("__custom__")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
prompt_for_model() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local backend="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local default_model="$2"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local choice=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local index
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local selected
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    load_model_menu_for_backend "$backend"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    while true; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Select model for $backend:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        for ((index = 0; index < ${#MODEL_MENU_LABELS[@]}; index++)); do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "  $((index + 1)). ${MODEL_MENU_LABELS[$index]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Choice [1-${#MODEL_MENU_VALUES[@]}] (default: 1): " choice
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        choice="${choice:-1}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [[ ! "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#MODEL_MENU_VALUES[@]}" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Invalid selection."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        selected="${MODEL_MENU_VALUES[$((choice - 1))]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "$selected" != "__custom__" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL="$selected"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        while true; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            read -r -p "Model ID (default: $default_model): " selected
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            selected="${selected:-$default_model}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ -n "$selected" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                MODEL="$selected"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Model ID is required."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
validate_backend() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$1" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        anthropic|openai|openrouter|ollama) return 0 ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        *) return 1 ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
normalize_ollama_api_url() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local raw="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local trimmed
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local no_query
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local scheme_rest
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    trimmed="$(trim_spaces "$raw")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$trimmed" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    no_query="${trimmed%%\?*}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    no_query="${no_query%%\#*}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    no_query="${no_query%/}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ ! "$no_query" =~ ^https?:// ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$no_query" == */v1/chat/completions ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf '%s\n' "$no_query"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$no_query" == */v1 ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf '%s/chat/completions\n' "$no_query"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    scheme_rest="${no_query#*://}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$scheme_rest" != */* ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf '%s/v1/chat/completions\n' "$no_query"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf '%s\n' "$no_query"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
models_endpoint_from_chat_endpoint() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$api_url" == */chat/completions ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf '%s\n' "${api_url%/chat/completions}/models"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf '%s\n' "$api_url"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
trim_spaces() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local value="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    value="${value#"${value%%[![:space:]]*}"}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    value="${value%"${value##*[![:space:]]}"}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf '%s' "$value"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
normalize_telegram_chat_ids() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local raw="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local token
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local seen=" "
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local normalized=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local count=0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local max_ids=4
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local IFS=','
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local part
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    for part in $raw; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        token="$(trim_spaces "$part")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ -z "$token" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if ! [[ "$token" =~ ^-?[0-9]+$ ]] || [ "$token" = "0" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [[ "$seen" == *" $token "* ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "$count" -ge "$max_ids" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        seen="${seen}${token} "
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ -z "$normalized" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            normalized="$token"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            normalized="$normalized,$token"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        count=$((count + 1))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$count" -eq 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf '%s\n' "$normalized"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
first_telegram_chat_id() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local raw="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local IFS=','
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local first=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local _rest=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    read -r first _rest <<< "$raw"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf '%s\n' "$first"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
csv_escape() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local value="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    value="${value//$'\r'/ }"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    value="${value//$'\n'/ }"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    value="${value//\"/\"\"}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "\"%s\"" "$value"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
flash_encryption_enabled() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local summary="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local raw_value
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local value
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    raw_value=$(echo "$summary" | awk -F= '/SPI_BOOT_CRYPT_CNT|FLASH_CRYPT_CNT/ {print $2; exit}' | awk '{print $1}')
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$raw_value" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$raw_value" =~ ^0x[0-9A-Fa-f]+$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        value=$((raw_value))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif [[ "$raw_value" =~ ^[0-9]+$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        value="$raw_value"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif [[ "$raw_value" = "0b001" || "$raw_value" = "0b011" || "$raw_value" = "0b111" ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    [ $((value % 2)) -eq 1 ]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
verify_anthropic_api_key() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_key="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local model="$2"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url_override="$3"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url="${api_url_override:-${ANTHROPIC_API_URL:-https://api.anthropic.com/v1/messages}}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local response_file
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local http_code
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local req_body
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! command -v curl >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Warning: curl not found; skipping Anthropic API check."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 2
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    req_body=$(cat <<EOF
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
{"model":"$model","max_tokens":16,"messages":[{"role":"user","content":"hello"}]}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
EOF
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    response_file="$(mktemp -t zclaw-anthropic-check.XXXXXX 2>/dev/null || mktemp)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! http_code="$(curl -sS -o "$response_file" -w "%{http_code}" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "content-type: application/json" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "x-api-key: $api_key" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "anthropic-version: 2023-06-01" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "$api_url" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -d "$req_body")"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Anthropic API check failed: network/transport error."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$http_code" = "200" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Anthropic API check passed (hello request succeeded)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Anthropic API check failed (HTTP $http_code)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if command -v python3 >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        python3 - "$response_file" <<'PY'
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import json
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import sys
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
from pathlib import Path
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
p = Path(sys.argv[1])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
try:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    data = json.loads(p.read_text(encoding="utf-8"))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
except Exception:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("Response preview: " + p.read_text(encoding="utf-8", errors="ignore")[:200])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    raise SystemExit(0)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
msg = ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if isinstance(data, dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if isinstance(data.get("error"), dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"].get("message") or data["error"].get("type") or ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif isinstance(data.get("error"), str):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if msg:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("API said: " + msg)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Response preview: $(head -c 200 "$response_file")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
verify_openai_api_key() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_key="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local _model="$2"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url_override="$3"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url="${api_url_override:-${OPENAI_API_URL:-https://api.openai.com/v1/models}}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local response_file
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local http_code
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! command -v curl >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Warning: curl not found; skipping OpenAI API check."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 2
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    # Runtime uses chat-completions. For key verification, always hit models endpoint.
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    api_url="$(models_endpoint_from_chat_endpoint "$api_url")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    response_file="$(mktemp -t zclaw-openai-check.XXXXXX 2>/dev/null || mktemp)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! http_code="$(curl -sS -o "$response_file" -w "%{http_code}" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "authorization: Bearer $api_key" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "$api_url")"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "OpenAI API check failed: network/transport error."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$http_code" = "200" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "OpenAI API check passed (models endpoint reachable)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "OpenAI API check failed (HTTP $http_code)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if command -v python3 >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        python3 - "$response_file" <<'PY'
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import json
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import sys
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
from pathlib import Path
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
p = Path(sys.argv[1])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
try:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    data = json.loads(p.read_text(encoding="utf-8"))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
except Exception:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("Response preview: " + p.read_text(encoding="utf-8", errors="ignore")[:200])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    raise SystemExit(0)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
msg = ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if isinstance(data, dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if isinstance(data.get("error"), dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"].get("message") or data["error"].get("type") or ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif isinstance(data.get("error"), str):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if msg:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("API said: " + msg)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Response preview: $(head -c 200 "$response_file")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
verify_openrouter_api_key() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_key="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local _model="$2"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url_override="$3"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url="${api_url_override:-${OPENROUTER_API_URL:-https://openrouter.ai/api/v1/models}}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local response_file
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local http_code
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local referer="${OPENROUTER_HTTP_REFERER:-https://github.com/danielboro/zclaw}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local title="${OPENROUTER_APP_TITLE:-zclaw}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! command -v curl >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Warning: curl not found; skipping OpenRouter API check."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 2
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    # Runtime uses chat-completions. For key verification, always hit models endpoint.
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    api_url="$(models_endpoint_from_chat_endpoint "$api_url")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    response_file="$(mktemp -t zclaw-openrouter-check.XXXXXX 2>/dev/null || mktemp)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! http_code="$(curl -sS -o "$response_file" -w "%{http_code}" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "authorization: Bearer $api_key" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "HTTP-Referer: $referer" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -H "X-Title: $title" \
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        "$api_url")"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "OpenRouter API check failed: network/transport error."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$http_code" = "200" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "OpenRouter API check passed (models endpoint reachable)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "OpenRouter API check failed (HTTP $http_code)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if command -v python3 >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        python3 - "$response_file" <<'PY'
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import json
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import sys
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
from pathlib import Path
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
p = Path(sys.argv[1])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
try:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    data = json.loads(p.read_text(encoding="utf-8"))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
except Exception:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("Response preview: " + p.read_text(encoding="utf-8", errors="ignore")[:200])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    raise SystemExit(0)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
msg = ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if isinstance(data, dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if isinstance(data.get("error"), dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"].get("message") or data["error"].get("type") or ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif isinstance(data.get("error"), str):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if msg:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("API said: " + msg)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Response preview: $(head -c 200 "$response_file")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
verify_ollama_endpoint() {
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_key="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local _model="$2"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local api_url="$3"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local models_url
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local response_file
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local http_code
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    local curl_args=()
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$api_url" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Ollama endpoint check skipped: no API URL configured."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! command -v curl >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Warning: curl not found; skipping Ollama endpoint check."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 2
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    models_url="$(models_endpoint_from_chat_endpoint "$api_url")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    response_file="$(mktemp -t zclaw-ollama-check.XXXXXX 2>/dev/null || mktemp)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    curl_args=(-sS -o "$response_file" -w "%{http_code}")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$api_key" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        curl_args+=(-H "authorization: Bearer $api_key")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    curl_args+=("$models_url")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if ! http_code="$(curl "${curl_args[@]}")"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Ollama endpoint check failed: network/transport error."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$http_code" = "200" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Ollama endpoint check passed (models endpoint reachable)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        return 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Ollama endpoint check failed (HTTP $http_code)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if command -v python3 >/dev/null 2>&1; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        python3 - "$response_file" <<'PY'
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import json
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
import sys
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
from pathlib import Path
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
p = Path(sys.argv[1])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
try:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    data = json.loads(p.read_text(encoding="utf-8"))
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
except Exception:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("Response preview: " + p.read_text(encoding="utf-8", errors="ignore")[:200])
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    raise SystemExit(0)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
msg = ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if isinstance(data, dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if isinstance(data.get("error"), dict):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"].get("message") or data["error"].get("type") or ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    elif isinstance(data.get("error"), str):
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        msg = data["error"]
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if msg:
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    print("API said: " + msg)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Response preview: $(head -c 200 "$response_file")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    rm -f "$response_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    return 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
}
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
while [ $# -gt 0 ]; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$1" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --port)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --port requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            PORT="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --port=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            PORT="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --ssid)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --ssid requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_SSID="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --ssid=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_SSID="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --pass)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --pass requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_PASS="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --pass=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_PASS="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --backend)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --backend requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            BACKEND="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --backend=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            BACKEND="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --model)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --model requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --model=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            MODEL="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --api-key)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --api-key requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            API_KEY="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --api-key=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            API_KEY="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --api-url)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --api-url requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            API_URL="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --api-url=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            API_URL="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-token)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --tg-token requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_TOKEN="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-token=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_TOKEN="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-chat-id)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --tg-chat-id requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_CHAT_IDS="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-chat-id=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_CHAT_IDS="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-chat-ids)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            [ $# -gt 0 ] || { echo "Error: --tg-chat-ids requires a value"; exit 1; }
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_CHAT_IDS="$1"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --tg-chat-ids=*)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            TG_CHAT_IDS="${1#*=}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --yes)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ASSUME_YES=true
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --skip-api-check)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_API_KEY=false
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        --print-detected-ssid)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            PRINT_DETECTED_SSID=true
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        -h|--help)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            usage
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            exit 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        *)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Error: unknown option '$1'"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            usage
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    shift
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$PRINT_DETECTED_SSID" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    DETECTED_SSID="$(detect_host_wifi_ssid || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$DETECTED_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "$DETECTED_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 0
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
source_idf_env || exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$PORT" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    select_serial_port || true
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$PORT" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Error: no serial port detected. Use --port."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
NORMALIZED_PORT="$(normalize_serial_port "$PORT")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$NORMALIZED_PORT" != "$PORT" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Using callout serial port: $NORMALIZED_PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    PORT="$NORMALIZED_PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$WIFI_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    DETECTED_SSID="$(detect_host_wifi_ssid || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ -n "$DETECTED_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_SSID="$DETECTED_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Detected host WiFi SSID: $WIFI_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Error: --ssid is required with --yes (auto-detect failed)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Tip: pass --ssid <network> or set ZCLAW_WIFI_SSID=<network>"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ -n "$DETECTED_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Detected host WiFi SSID: $DETECTED_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ -t 0 ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ -n "$DETECTED_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "Press Enter to use detected network, or type a different SSID."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                read -r -p "WiFi SSID [$DETECTED_SSID]: " WIFI_SSID
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                WIFI_SSID="${WIFI_SSID:-$DETECTED_SSID}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                read -r -p "WiFi SSID: " WIFI_SSID
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        elif [ -n "$DETECTED_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            WIFI_SSID="$DETECTED_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$WIFI_SSID" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Error: WiFi SSID is required"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
validate_wifi_ssid_length || exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$BACKEND" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        BACKEND="openai"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "LLM provider [openai/anthropic/openrouter/ollama] (default: openai): " BACKEND
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        BACKEND="${BACKEND:-openai}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if ! validate_backend "$BACKEND"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Error: invalid backend '$BACKEND' (expected anthropic|openai|openrouter|ollama)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -z "$MODEL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    DEFAULT_MODEL="$(default_model_for_backend "$BACKEND")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        MODEL="$DEFAULT_MODEL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        prompt_for_model "$BACKEND" "$DEFAULT_MODEL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$BACKEND" = "ollama" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Error: --api-url is required with --backend ollama in --yes mode"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Ollama endpoint URL (base or /v1/chat/completions): " API_URL
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    API_URL="$(normalize_ollama_api_url "$API_URL" || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: invalid --api-url. Expected http(s) URL."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$BACKEND" != "ollama" ] && [ -z "$API_KEY" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: --api-key is required with --yes"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    read -r -p "LLM API key (input is visible): " API_KEY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$BACKEND" != "ollama" ] && [ -z "$API_KEY" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Error: API key is required"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$VERIFY_API_KEY" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    VERIFY_LABEL=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    VERIFY_FN=""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    case "$BACKEND" in
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        anthropic)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_LABEL="Anthropic"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_FN="verify_anthropic_api_key"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openai)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_LABEL="OpenAI"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_FN="verify_openai_api_key"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        openrouter)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_LABEL="OpenRouter"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_FN="verify_openrouter_api_key"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        ollama)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_LABEL="Ollama endpoint"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            VERIFY_FN="verify_ollama_endpoint"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            ;;
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    esac
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$VERIFY_FN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        while true; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ "$BACKEND" = "ollama" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "Verifying ${VERIFY_LABEL} with a quick connectivity check..."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "Verifying ${VERIFY_LABEL} API key with a quick connectivity check..."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if "$VERIFY_FN" "$API_KEY" "$MODEL" "$API_URL"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                break
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "Error: API check failed in --yes mode."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                echo "Use --skip-api-check to bypass."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [ "$BACKEND" = "ollama" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                read -r -p "Re-enter Ollama endpoint URL and retry? [Y/n] " retry_key
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                read -r -p "Re-enter API key and retry? [Y/n] " retry_key
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            retry_key="${retry_key:-Y}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [[ "$retry_key" =~ ^[Yy]$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                if [ "$BACKEND" = "ollama" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    read -r -p "Ollama endpoint URL (base or /v1/chat/completions): " API_URL
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    API_URL="$(normalize_ollama_api_url "$API_URL" || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    if [ -z "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        echo "Valid API URL is required."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                else
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    read -r -p "LLM API key (input is visible): " API_KEY
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    if [ -z "$API_KEY" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                        echo "API key is required."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            read -r -p "Continue provisioning anyway? [y/N] " continue_anyway
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            if [[ "$continue_anyway" =~ ^[Yy]$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
                break
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            echo "Aborted."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
            exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$ASSUME_YES" != true ] && [ -z "$WIFI_PASS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    prompt_wifi_password
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
while ! check_wifi_credentials; do
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ "$ASSUME_YES" = true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Aborted."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    read -r -p "Re-enter WiFi password? [Y/n] " retry_wifi_pass
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    retry_wifi_pass="${retry_wifi_pass:-Y}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [[ "$retry_wifi_pass" =~ ^[Yy]$ ]]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        prompt_wifi_password
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        continue
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Aborted."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
done
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ "$ASSUME_YES" != true ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$TG_TOKEN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Telegram bot token (optional): " TG_TOKEN
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$TG_CHAT_IDS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        read -r -p "Telegram chat ID(s) (optional, comma-separated): " TG_CHAT_IDS
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -n "$TG_CHAT_IDS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    NORMALIZED_TG_CHAT_IDS="$(normalize_telegram_chat_ids "$TG_CHAT_IDS" || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "$NORMALIZED_TG_CHAT_IDS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "Error: invalid --tg-chat-id value. Use 1-4 non-zero integers (comma-separated)."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    TG_CHAT_IDS="$NORMALIZED_TG_CHAT_IDS"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -n "$TG_TOKEN" ] && [ -z "$TG_CHAT_IDS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Warning: Telegram token set without chat ID allowlist; incoming messages will be ignored."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
# Handle fallback URL and model: if not provided, set to primary
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        FALLBACK_URL="${API_URL:-{CONFIG_ZCLAW_LLM_FALLBACK_URL:-http://localhost:11434/v1}}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -z "" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        FALLBACK_MODEL="${MODEL:-{CONFIG_ZCLAW_LLM_FALLBACK_MODEL:-llama2}}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "Error: parttool.py not found at $PARTTOOL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    exit 1
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t zclaw-provision)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
csv_file="$tmpdir/nvs.csv"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
nvs_bin="$tmpdir/nvs.bin"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
trap 'rm -rf "$tmpdir"' EXIT
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
{
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "key,type,encoding,value"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "zclaw,namespace,,"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "wifi_ssid,data,string,%s\n" "$(csv_escape "$WIFI_SSID")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "wifi_pass,data,string,%s\n" "$(csv_escape "$WIFI_PASS")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "llm_backend,data,string,%s\n" "$(csv_escape "$BACKEND")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "api_key,data,string,%s\n" "$(csv_escape "$API_KEY")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    printf "llm_model,data,string,%s\n" "$(csv_escape "$MODEL")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "llm_api_url,data,string,%s\n" "$(csv_escape "$API_URL")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$FALLBACK_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "llm_fallback_url,data,string,%s
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
" "$(csv_escape "$FALLBACK_URL")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$FALLBACK_MODEL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$FALLBACK_API_KEY" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "llm_fallback_api_key,data,string,%s
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
" "$(csv_escape "$FALLBACK_API_KEY")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$FALLBACK_API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "llm_fallback_api_url,data,string,%s
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
" "$(csv_escape "$FALLBACK_API_URL")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
" "$(csv_escape "$FALLBACK_MODEL")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$TG_TOKEN" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "tg_token,data,string,%s\n" "$(csv_escape "$TG_TOKEN")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$TG_CHAT_IDS" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        PRIMARY_TG_CHAT_ID="$(first_telegram_chat_id "$TG_CHAT_IDS")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "tg_chat_id,data,string,%s\n" "$(csv_escape "$PRIMARY_TG_CHAT_ID")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        printf "tg_chat_ids,data,string,%s\n" "$(csv_escape "$TG_CHAT_IDS")"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
} > "$csv_file"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "Generating NVS credential image..."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
python "$NVS_GEN" generate "$csv_file" "$nvs_bin" 0x4000
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "Writing credentials to NVS on $PORT..."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
EFUSE_SUMMARY="$(espefuse.py --port "$PORT" summary 2>/dev/null || true)"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PARTTOOL_ARGS=(python "$PARTTOOL" --port "$PORT")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if flash_encryption_enabled "$EFUSE_SUMMARY"; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    PARTTOOL_ARGS+=(--esptool-write-args encrypt)
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
PARTTOOL_ARGS+=(write_partition --partition-name nvs --input "$nvs_bin")
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
"${PARTTOOL_ARGS[@]}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL

t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "Provisioning complete."
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  WiFi SSID: $WIFI_SSID"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  WiFi password: ${WIFI_PASS:-<empty>}"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  Backend:   $BACKEND"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  Model:     $MODEL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    if [ -n "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
        echo "  API URL:   $API_URL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "  Fallback URL: $FALLBACK_URL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "  Fallback Model: $FALLBACK_MODEL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
if [ -n "$API_URL" ]; then
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
    echo "  API URL:   $API_URL"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
fi
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo ""
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "Next steps:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  1) Board reset is automatic after provisioning"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "     If it does not boot, reset or power-cycle manually"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  2) Run ./scripts/monitor.sh $PORT"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  3) Wait for WiFi connected + Ready logs"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "     Look for startup marker:"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "       I (...) main: ========================================"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "       I (...) main:   Ready! Free heap: <bytes> bytes"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "       I (...) main: ========================================"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
echo "  4) Run ./scripts/web-relay.sh and send a test message to confirm end-to-end chat"
t--fallback-api-key <key>       Fallback LLM API key (required for anthropic/openai/openrouter)
	--fallback-api-url <url>         Fallback LLM API URL
