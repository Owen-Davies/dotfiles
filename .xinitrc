#!/bin/bash

PASSWORD_STORE_DIR=/home/owen/Nextcloud/.password-store

# launch agents
eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

# set the desktop background
feh --bg-scale ~/Nextcloud/Pictures/leaf.png

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

xset r rate 250 60		# keyboard repeat delay and rate

# Fonts
xset +fp ~/.fonts &
set fp rehash &


# setup screenlock
xautolock -time 1 -locker slock &
/home/owen/source/dotfiles/scripts/dwmbar &
exec dwm
