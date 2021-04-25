#!/bin/bash
wmctrl -i -r $(wmctrl -l | grep Telegram | cut -d" " -f1) -b remove,demands_attention
wmctrl -i -r $(wmctrl -l | grep Thunderbird | cut -d" " -f1) -b remove,demands_attention
