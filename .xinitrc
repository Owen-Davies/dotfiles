#!/bin/bash

PASSWORD_STORE_DIR=/home/owen/Nextcloud/.password-store

# launch agents
eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

userresources=$HOME/.Xresources

#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi

# Keyboard repeat delay and rate
xset r rate 200 60		

# Swap capslock and escape
# setxkbmap -option caps:swapescape
# Make capslock another escape, but act like ctrl if held with another key
setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &

# Fonts
#xset +fp ~/.fonts &
#set fp rehash &

# Old xrandr config
#xrandr --dpi 144 --output eDP-1 --mode 1920x1080 --scale 1x1
#xrandr --dpi 144 --output DP-1 --scale 1x1

# NEW XRANDR CONFIG (Generated from arandr)
~/.screenlayout/laptop.sh

feh --bg-fill ~/dev/dotfiles/backgrounds/breaking-bad-camper.jpg

alias t="todo.sh"

xautolock -time 1 -locker slock &
start-pulseaudio-x11 &
dwm
