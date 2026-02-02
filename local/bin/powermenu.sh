#!/bin/bash

# Icons
SHUTDOWN=""
REBOOT=""
SUSPEND="󰤄"
LOGOUT=""
LOCK=""

options="$LOCK    Lock\n$LOGOUT  Logout\n$SUSPEND    Suspend\n$REBOOT    Reboot\n$SHUTDOWN    Shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" \
  -show-icons \
  -config ~/.config/rofi/config.rasi)

case "$chosen" in
*Shutdown*)
  systemctl poweroff
  ;;
*Reboot*)
  systemctl reboot
  ;;
*Suspend*)
  systemctl suspend && hyprlock
  ;;
*Logout*)
  hyprctl dispatch exit
  ;;
*Lock*)
  hyprlock
  ;;
esac
