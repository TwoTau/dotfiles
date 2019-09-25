#!/bin/sh

hour="$(($(date +"%-I")-1))"
TIMES=(           )
echo "${TIMES[$hour]} $(date +"%b %-d  / %l:%M:%S %p")"