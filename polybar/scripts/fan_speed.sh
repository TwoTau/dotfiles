#!/bin/bash

FAN_SPEED=$(sensors | grep fan1 | cut -c14-17)
if [[ "$FAN_SPEED" -gt "0" ]]; then
	echo " $FAN_SPEED"
else
	echo "ﴛ"
fi