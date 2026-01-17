echo "changing directory"
cd ~/.config/hypr/sounds/volumes

volumefile=$(hyprctl activewindow -j | jq -r '.class')-volume.txt
echo $volumefile
currentVolume=$(cat $volumefile)
echo $currentVolume

if ! [ -e $volumefile ]; then
  echo 1 > $volumefile
fi

if (( $(echo "$currentVolume > 0" | bc -l) )); then
  volume=$(qalc -t $(cat $volumefile) - 0.1)
  echo $volume > $volumefile
  # play sound
fi

