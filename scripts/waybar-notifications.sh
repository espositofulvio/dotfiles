#!/bin/env bash
# dunst notification daemon notification module

msgCount=$(makoctl list | wc -l)
enabled=
disabled=󰂛

if makoctl mode | grep -q "do-not-disturb"
then 
  echo "{\"text\": \"$disabled\", \"alt\": \"\", \"tooltip\": \"$msgCount\", \"class\": \"paused\"}"
else 
  echo "{\"text\": \"$enabled\", \"alt\": \"\", \"tooltip\": \"\", \"class\": \"unpaused\"}"
fi  
