#!/bin/sh
xrandr --output DP-1 --off --output eDP-1 --primary --mode 3840x2160 --scale 0.75x0.75 --dpi 331 --pos 0x0 --rotate normal --output DP-2 --off

# Reset wallpaper
feh --bg-fill ~/dev/dotfiles/Pictures/backgrounds/breaking-bad-camper.jpg
