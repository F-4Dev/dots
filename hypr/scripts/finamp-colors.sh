gbusd call \
  --session \
  --dest 'com.unicornsonlsd.FinampSettings' \
  --object-path '/com/unicornsonlsd/Finamp' \
  --method 'com.unicornsonlsd.Finamp.setAccentColor' \
  $(cat .config/gtk-4.0/colors.css | grep accent_color | awk '{print $3}' | sed 's/;//')