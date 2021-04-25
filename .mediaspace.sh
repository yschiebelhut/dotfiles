#!/bin/bash
CUR_WORKSPACE=$(wmctrl -d | grep "\*" | cut -d" " -f1)
if [ $CUR_WORKSPACE != 0 ]; then
	wmctrl -d | grep "\*" | cut -d" " -f1 > ~/.cur_workspace.tmp
	wmctrl -s 0
else
	DEST_WORKSPACE=$(head -n1 ~/.cur_workspace.tmp); wmctrl -s $DEST_WORKSPACE
fi
