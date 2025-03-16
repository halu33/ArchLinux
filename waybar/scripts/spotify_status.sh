#!/bin/bash

if ! playerctl -l 2>/dev/null | grep -q spotify; then
    exit 0
fi

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
position_sec=$(playerctl position 2>/dev/null | cut -d'.' -f1)
duration_usec=$(playerctl metadata mpris:length 2>/dev/null)

format_time() {
    local t=$1
    printf "%02d:%02d" $((t / 60)) $((t % 60))
}

if [[ "$status" == "Playing" ]]; then
    icon=""
elif [[ "$status" == "Paused" ]]; then
    icon=""
else
    exit 0
fi

duration_sec=$((duration_usec / 1000000))
pos_fmt=$(format_time "$position_sec")
dur_fmt=$(format_time "$duration_sec")

text="$icon $title - $artist [$pos_fmt/$dur_fmt]"
tooltip="$title by $artist"

echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\"}"
