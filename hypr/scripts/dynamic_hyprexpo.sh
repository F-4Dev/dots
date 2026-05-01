get_current_monitor() {
	hyprctl activeworkspace -j | jq -r '.monitor'
}

current_monitor=$(get_current_monitor)

if [[ "$current_monitor" == "DP-1" ]]; then
	sed -i 's/workspace_method = workspace .*/workspace_method = workspace 1/g' /home/f4/.config/hypr/dynamic_hyprexpo.conf
else
	sed -i 's/workspace_method = workspace .*/workspace_method = workspace 11/g' /home/f4/.config/hypr/dynamic_hyprexpo.conf
fi
