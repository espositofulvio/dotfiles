#!/bin/sh

LAPTOP_OUTPUT="eDP-2"
LID_STATE_FILE="/proc/acpi/button/lid/LID1/state"

read -r LS < "$LID_STATE_FILE"

case "$LS" in
*open)   swaymsg output "$LAPTOP_OUTPUT" enable ;;
*closed) swaymsg output "$LAPTOP_OUTPUT" disable ;;
*)       echo "Could not get lid state" >&2 ; exit 1 ;;
esac
