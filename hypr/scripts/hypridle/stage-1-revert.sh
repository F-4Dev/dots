# restore old brightness
ddcutil setvcp 10 $(cat /tmp/brightness-d1.txt) -d 1
ddcutil setvcp 10 $(cat /tmp/brightness-d2.txt) -d 2