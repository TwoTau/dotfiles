#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# delete ipc symlinks
rm /tmp/ipc-topbar /tmp/ipc-bottombar

# Launch both bars and create ipc symlinks
polybar topbar &
# ln -s /tmp/polybar_mqueue.$! /tmp/ipc-topbar
# polybar bottombar &
# ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottombar

echo "Bars launched..."
