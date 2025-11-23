sleep 3

# reload hyprland colors
hyprctl reload

# get current path to image
imagePath="$(swww query | grep -o '/.*' | uniq)"

# generate matugen colors
matugen image "$imagePath"

# update pywal colors (firefox/vscode)
wal -n -i "$imagePath" && pywalfox update

# set tofi colors
sh ~/.config/tofi/config.sh

# restart swaync to update colors
pkill swaync ; swaync

# finamp colors ✨️
gdbus call \
    --session \
    --dest 'com.unicornsonlsd.FinampSettings' \
    --object-path '/com/unicornsonlsd/Finamp' \
    --method 'com.unicornsonlsd.Finamp.setAccentColor' \
    $(cat .config/gtk-4.0/colors.css | grep accent_color | awk '{print $3}' | sed 's/;//')

# fix gtk 3.0 apps
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# keyboard
openrgb -d "Logitech G Pro RGB Mechanical Gaming Keyboard" -c $(cat .config/gtk-4.0/colors.css | grep accent_color | awk '{print $3}' | sed 's/;//' | sed 's/#//')
# mouse
openrgb -d "SteelSeries Aerox 3 Wired" -b 5 -c $(cat .config/gtk-4.0/colors.css | grep accent_fg_color | awk '{print $3}' | sed 's/;//' | sed 's/#//')

