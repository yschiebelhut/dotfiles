#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$STATUS" = Discharging -a "$LEVEL" -le 5 ]; then
	systemctl hibernate
fi
