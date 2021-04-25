#!/bin/bash

xsetwacom set "Wacom Intuos PT S Pad pad" "Button" "1" 11
xsetwacom set "Wacom Intuos PT S Pad pad" "Button" "3" 12
xsetwacom set "Wacom Intuos PT S Pad pad" "Button" "8" 13
xsetwacom set "Wacom Intuos PT S Pad pad" "Button" "9" 14

killall xbindkeys; sleep 0.2; xbindkeys -f ~/.wacom/intuos/xbindkeysrc-intuos
