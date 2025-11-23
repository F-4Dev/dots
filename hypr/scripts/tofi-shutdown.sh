#!/usr/bin/env bash

action=$(printf "Suspend\nReboot\nShutdown" | tofi --require-match=false --prompt-text=" " | grep -e "[(Suspend)(Reboot)(Shutdown)]" ) 

case $action in
  
  "Suspend")
    systemctl suspend
    ;;

  "Reboot")
    systemctl reboot
    ;;

  "Shutdown")
    systemctl poweroff   
    ;;

  "kys")
    systemctl poweroff   
    ;;

  "kill yourself")
    systemctl poweroff   
    ;;

  *)
    exit
    ;;

esac

