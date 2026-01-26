#!/usr/bin/env bash

TIME=$(date "+%H:%M")
DATE=$(date "+%a %d %b")
BATTERY=$(cat /sys/class/power_supply/BAT*/capacity) # 2>/dev/null) # | head -n1)

notify-send "  ~~INFO~~" \ "}BATTERY: <i>$BATTERY%</i> \n }DATE:    <i>$DATE</i> \n }TIME:    <i>$TIME</i>"
