sleep 3

# reload hyprland colors
hyprctl reload

# get current path to image
imagePath="$(swww query | grep -o '/.*' | uniq)"

# generate matugen colors
matugen image "$imagePath"

# update colors pywal colors (firefox/vscode)
wal -i "$imagePath" && pywalfox update

# set tofi colors
sh ~/.config/tofi/config.sh

# set discord colors 
# sed -i "s/\"color\": \"[^\"]*\"/\"color\": \"$(cat ~/.config/vesktop/settings/colors)\"/" ~/.config/vesktop/settings/settings.json

# pkill waybar
# waybar