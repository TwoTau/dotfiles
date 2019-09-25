#!/bin/bash

rofi_command="rofi -config $DOTDIR/rofi/four-icons.rasi"

lock=""
suspend="鈴"
power_off=""
reboot=""
options="$lock\n$suspend\n$power_off\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $lock)
		i3lock --color=000000 -nfe
        ;;
    $suspend)
        # mpc -q pause
        # amixer set Master mute
        systemctl suspend
        ;;
    $power_off)
        sudo shutdown -h now
        ;;
    $reboot)
        reboot
        ;;
esac
