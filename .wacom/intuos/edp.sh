#!/bin/bash
SLEEP_DURATION=0.0

xsetwacom set "Wacom Intuos PT S Pen stylus" MapToOutput eDP1
sleep $SLEEP_DURATION
xsetwacom set "Wacom Intuos PT S Pen eraser" MapToOutput eDP1
sleep $SLEEP_DURATION
