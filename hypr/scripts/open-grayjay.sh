hyprctl dispatch exec '[workspace special:background silent] /usr/bin/grayjay' && \
sleep 3 && \

zen-browser localhost:$(ss -tulpn | grep Grayjay | grep 512 |awk '{print $5}' | awk -F: '{print $2}')