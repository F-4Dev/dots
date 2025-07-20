volumefile=$(hyprctl activewindow -j | jq -r '.class')-volume.txt

echo "changing directory"
cd ~/.config/hypr/sounds/volumes

if ! [ -e $volumefile ]; then
    echo 1 > $volumefile
fi

volume=$(qalc -t $(cat $volumefile) + 0.1)
echo $volume > $volumefile
