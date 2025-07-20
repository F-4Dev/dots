# Get the current monitor and workspace info
current_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Get all workspaces on current monitor, sorted by ID
next_workspace=$(hyprctl workspaces -j | jq -r --arg mon "$current_monitor" '
  map(select(.monitor == $mon)) 
  | sort_by(.id) 
  | map(.id) 
  | . as $ids 
  | ($ids | index('"$current_workspace"') + 1) as $next 
  | if $next < ($ids | length) then $ids[$next] else $ids[0] end
')

# Switch to the next workspace
hyprctl dispatch workspace "$next_workspace"
