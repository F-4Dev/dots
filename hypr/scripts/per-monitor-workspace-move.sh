#!/bin/sh
get_current_monitor() {
	hyprctl activeworkspace -j | jq -r '.monitor'
}

current_monitor=$(get_current_monitor)

if [[ "$current_monitor" == "DP-1" ]]; then
	hyprctl dispatch movetoworkspace "$1"
elif [[ "$current_monitor" == "HDMI-A-1" ]]; then
	hyprctl dispatch movetoworkspace "$(($1 + 10))"
fi
