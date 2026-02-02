#!/usr/bin/env bash

#########################################
##### Battery State Change Notifier #####
#########################################

status_initial=$(cat /sys/class/power_supply/BAT0/status)

while true; do
  #Current Battery Status(Discharging/Charging)
  status_current=$(cat /sys/class/power_supply/BAT0/status)

  #If there is a state change in batter power
  if [ "$status_initial" != "$status_current" ]; then
    status_initial="$status_current"
    # Gets Current Battery capacity
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$status_current" = "Discharging" ]; then
      notify-send -u normal "Charger Removed! Going into Battery Power Mode..." "Battery currently at ${capacity}%. Discharging!"
      pw-play --volume=1 /usr/share/sounds/freedesktop/stereo/power-unplug.oga
    else
      notify-send -u normal "Charger Plugged In! Going to AC Power Mode..." "Battery currently at ${capacity}%. Charging!"
      pw-play --volume=1 /usr/share/sounds/freedesktop/stereo/power-plug.oga
    fi
  fi

  # Repeat every "1" second
  sleep 1
done
