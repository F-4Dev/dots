# Kill the hypridle process and change the icon state to default
pkill hypridle && \
sed -i 's/disabled/default/g' ~/.config/waybar/custom-hypridle/icon-change.sh || \

# If the previous command fails, change the icon state to disabled and restart hypridle
(sed -i 's/default/disabled/g' ~/.config/waybar/custom-hypridle/icon-change.sh && hypridle)
