#!/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Simple Script To Pick Color Quickly.

color=$(grim -g "`slurp -b 1B1F2800 -p`" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | tail -n1 | cut -d' ' -f4)
image=/tmp/${color}.png

main() {
	if [[ "$color" ]]; then
		# copy color code to clipboard
		echo $color | tr -d "\n" | wl-copy
		# generate preview
		convert -size 48x48 xc:"$color" ${image}
		# notify about it
		notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i ${image} "$color, copied to clipboard."
	fi
}

# Run the script
main

