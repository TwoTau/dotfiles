#!/bin/bash

# notify-send -u low -t 5000 -- 'Enabled screen locking'

xautolock -detectsleep \
  -time 5 -locker "i3lock --color=000000 -nfe" \
  -notify 20 \
  -notifier "notify-send -u critical -t 10000 -- 'Locking in 20 seconds'"

# xautolock -detectsleep -time 2 -locker "systemctl suspend"