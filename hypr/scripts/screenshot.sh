cursorPos=$(hyprctl cursorpos | tr -d ',')
hyprctl dispatch movecursor 10000 10000
wayfreeze --hide-cursor & PID=$!
sleep .01
hyprctl dispatch movecursor $cursorPos
IMG="$HOME/Pictures/Screenshots/$(date +"%Y-%m-%d-%H:%M:%S").png"
hyprctl keyword layerrule "noanim,selection" >/dev/null
wayshot -f $IMG -s "$(slurp)"
wl-copy < $IMG
kill $PID
if [ -f $IMG ]; then
    notify-send -u low -t 5000 -i $IMG "Screenshot Saved" "$(basename $IMG)"
fi
