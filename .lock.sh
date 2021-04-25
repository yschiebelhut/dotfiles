#!/bin/bash
#import -silent -window root /tmp/screen.jpg
#convert /tmp/screen.jpg -scale 5% -scale 2000% -scale 40% -blur 0,15 -scale 250% /tmp/screen.png
#convert /tmp/screen.jpg -scale 3% -scale 8000% /tmp/screen.png
#convert /tmp/screen.jpg -scale 5% -scale 2500% /tmp/screen.png
#i3lock -f -i /tmp/screen.png
#rm /tmp/screen.png /tmp/screen.jpg
#i3-msg 'workspace 0'
#xtrlock -f

#i3lock -fei .lockscreen.png
#XSECURELOCK_NO_COMPOSITE=1 XSECURELOCK_SHOW_DATETIME=1 xsecurelock
export XSECURELOCK_SAVER=saver_mpv
#export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/.lockwallpapers/ -type f"
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/.usearch/ -type f"
export XSECURELOCK_IMAGE_DURATION_SECONDS=1000
XSECURELOCK_NO_COMPOSITE=1 XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_DATETIME_FORMAT="%A, %B %d %Y %T %Z" xsecurelock
