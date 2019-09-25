#!/bin/sh

NEWLINE=$'\n'

source ~/venv/bin/activate

UPTIME=$(uptime -p | cut -c4-)
dunstify "Uptime: $UPTIME" --appname='summary' -r 1246803

# BRIGHTNESS=$(xbacklight -get)

CPU_TEMPS=$(sensors | grep 'Core' | cut -c17-18 | paste -s -d' ')
dunstify "CPU temps: $CPU_TEMPS" --appname='summary' -r 1246804

BATTERY_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
BATTERY_TIME_LEFT=$(echo "$BATTERY_INFO" | grep 'time to empty' | cut -c26-)
BATTERY_ENERGY=$(echo "$BATTERY_INFO" | grep 'energy:' | cut -c26-)
BATTERY_FULL_ENERGY=$(echo "$BATTERY_INFO" | grep 'energy-full:' | cut -c26-)
BATTERY_ENERGY_RATE=$(echo "$BATTERY_INFO" | grep 'energy-rate:' | cut -c26-)
BATTERY_VOLTAGE=$(echo "$BATTERY_INFO" | grep 'voltage:' | cut -c26-)

if [ ! -z "$BATTERY_TIME_LEFT" ]; then
	dunstify "Battery time left: $BATTERY_TIME_LEFT" --appname='summary' -r 1246802
fi

dunstify "Battery energy: $BATTERY_ENERGY/$BATTERY_FULL_ENERGY ${NEWLINE}\
Battery energy rate: $BATTERY_ENERGY_RATE ${NEWLINE}\
Battery voltage: $BATTERY_VOLTAGE" --appname='summary' -r 1246805

# UNREAD=$(python $DOTDIR/polybar/scripts/gmail-unread/unread.py)
# if [[ "$UNREAD" -gt "0" ]]; then
# 	dunstify " Unread email: $UNREAD" --appname='summary' -r 1246801
# fi