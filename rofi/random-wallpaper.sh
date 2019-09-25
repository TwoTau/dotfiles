#!/bin/bash

rofi_command="rofi -config $DOTDIR/rofi/four-icons.rasi"

winter=""
dark="望"
worlds=""
trees="滑"

options="$winter\n$dark\n$worlds\n$trees"
chosen="$(echo -e "$options" | $rofi_command -dmenu)"

collection_id=0

case $chosen in
    $winter)
        collection_id=3178572
        ;;
    $dark)
        collection_id=1127828
        ;;
    $worlds)
        collection_id=573009
        ;;
    $trees)
        collection_id=1525582
        ;;
esac

unsplash-wallpaper -w 1920 -h 1080 -o $collection_id -d $DOTDIR/i3/wallpapers
