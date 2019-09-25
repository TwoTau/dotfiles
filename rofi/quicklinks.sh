#!/bin/bash

rofi_command="rofi -config $DOTDIR/rofi/four-icons.rasi"

messenger=""
gmail=""
school="拾"
github=""
options="$messenger\n$gmail\n$school\n$github"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $messenger)
		chromium https://www.messenger.com
        ;;
    $gmail)
        chromium https://mail.google.com/mail/u/0/
        ;;
    $school)
        chromium https://courses.cs.washington.edu/courses/cse331/19au/
        ;;
    $github)
        chromium https://github.com
        ;;
esac
