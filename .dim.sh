#!/bin/bash

# get data about mouse and brightness
XPOS=$(xdotool getmouselocation | cut -d":" -f2 | cut -d" " -f1)
YPOS=$(xdotool getmouselocation | cut -d":" -f3 | cut -d" " -f1)
BRIGHTNESS=$(brightnessctl g -m)

# set brightness to 0
brightnessctl s 0 -q

# create temporary variables
TMPXPOS=$XPOS
TMPYPOS=$YPOS

# check for change of pointer location
while [[ $TMPXPOS == $XPOS && $TMPYPOS == $YPOS ]]; do
	TMPXPOS=$(xdotool getmouselocation | cut -d":" -f2 | cut -d" " -f1)
	TMPYPOS=$(xdotool getmouselocation | cut -d":" -f3 | cut -d" " -f1)

	sleep 0.5
done

# reapply former brightness
brightnessctl s $BRIGHTNESS -q
