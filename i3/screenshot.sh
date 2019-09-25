#!/bin/sh

SCREENSHOTDIR="/mnt/quantum/screenshots/$(date +'%Y-%m')"
mkdir -p $SCREENSHOTDIR
FILENAME=$(date +'%Y-%m-%d_%H-%M-%S.png')
FILEPATH="$SCREENSHOTDIR/$FILENAME"
import $FILEPATH

ACTION=$(dunstify --action="copyAction,reply" "Took screenshot: $FILENAME" --icon=$FILEPATH --appname="screenshot" -r 12468)
if [[ "$ACTION" -eq "copyAction" ]]; then
	copyq write image/png - < $FILEPATH && copyq select 0
	dunstify "Copied screenshot: $FILENAME" --icon=$FILEPATH --appname="screenshot" -r 12468
fi