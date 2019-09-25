#!/bin/sh

source ~/venv/bin/activate
UNREAD=$(python $DOTDIR/polybar/scripts/gmail-unread/unread.py)
if [[ -z "$UNREAD" ]]; then
	echo " "
elif [[ "$UNREAD" -gt "0" ]]; then
	echo " $UNREAD"
else
	echo ""
fi