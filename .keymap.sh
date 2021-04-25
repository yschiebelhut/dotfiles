#!/bin/bash

while true; do
	inotifywait -q -e create -e delete --exclude '.*tmp.*' /dev/input/
	sleep 1
	#setxkbmap de
	#sleep 1
	#xmodmap ~/.Xmodmap
	xkbcomp ~/.keymap.xkb $DISPLAY
done
