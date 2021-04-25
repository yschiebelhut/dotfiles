#!/bin/bash
SLEEP_DURATION=0.0

xsetwacom set "Wacom Intuos PT S Pen stylus" MapToOutput HDMI1
sleep $SLEEP_DURATION
xsetwacom set "Wacom Intuos PT S Pen eraser" MapToOutput HDMI1
sleep $SLEEP_DURATION
