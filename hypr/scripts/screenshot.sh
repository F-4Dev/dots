hyprctl keyword cursor:invisible true
sleep 0.1
wayfreeze & PID=$!
hyprctl keyword cursor:invisible false
IMG="$HOME/Pictures/Screenshots/$(date +"%Y-%m-%d-%H:%M:%S").png"
hyprctl keyword layerrule "noanim,selection" >/dev/null
wayshot -f $IMG -s "$(slurp)"
wl-copy < $IMG
kill $PID
if [ -f $IMG ]; then
    notify-send -u low -t 5000 -i $IMG "Screenshot Saved" "$(basename $IMG)"
fi
