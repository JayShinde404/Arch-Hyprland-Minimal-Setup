#!/usr/bin/env bash

TIME=$(date "+%H:%M")
DATE=$(date "+%a %d %b")
BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)

notify-send "  ~~INFO~~" \ "}BATTERY: <i>$BATTERY%</i> \n }DATE:    <i>$DATE</i> \n }TIME:    <i>$TIME</i>"
