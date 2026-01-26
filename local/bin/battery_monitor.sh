#!/usr/bin/env bash

###############################
##### LOW BATTERY WARNING #####
###############################

# Configuration
BATTERY_PATH="/sys/class/power_supply/BAT0" # Change if your battery is named differently (BAT1, etc.)
LOW_BATTERY=25                              # Warning threshold
CRITICAL_BATTERY=15                         # Critical threshold
CHECK_INTERVAL=5                            # Check every 60 seconds

# Check if battery exists
if [ ! -d "$BATTERY_PATH" ]; then
  echo "Battery not found at $BATTERY_PATH"
  echo "Available batteries:"
  ls /sys/class/power_supply/
  exit 1
fi

# Track notification state to avoid spam
last_notification=""

while true; do
  # Read battery percentage
  capacity=$(cat "$BATTERY_PATH/capacity")
  status=$(cat "$BATTERY_PATH/status")

  # Only send notification if not plugged in/Discharging
  if [ "$status" = "Discharging" ]; then
    #If battery is very low(at the Critical Point defined above)
    if [ "$capacity" -le "$CRITICAL_BATTERY" ] && [ "$last_notification" != "critical" ]; then
      notify-send -u critical "Battery Critical" "Battery at ${capacity}%! Plug in charger immediately!" -i battery-empty
      pw-play --volume=1.0 /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &
      last_notification="critical"
    # Only if the battery is low, which is defined at the LOW_BATTERY variable above
    elif [ "$capacity" -le "$LOW_BATTERY" ] && [ "$last_notification" != "low" ]; then
      notify-send -u normal "Low Battery" "Battery at ${capacity}%. Please charge soon." -i battery-low
      pw-play --volume=0.8 /usr/share/sounds/freedesktop/stereo/complete.oga &
      last_notification="low"
    fi
  else
    #Notify if Battery is full
    if [ "$capacity" = "99" ]; then
      notify-send -u normal "Fully Charged!" "Battery at ${capacity}%, please unplug the charger!" -i battery-full
      pw-play --volume=0.8 /usr/share/sounds/freedesktop/stereo/complete.oga
    fi
    # Reset notification state when charging
    last_notification=""
  fi

  sleep "$CHECK_INTERVAL"
done
