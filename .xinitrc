export XDG_CURRENT_DESKTOP=gnome
test -f ~/.keymap.xkb && xkbcomp ~/.keymap.xkb $DISPLAY
xrdb -merge ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
