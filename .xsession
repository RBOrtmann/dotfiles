#!/bin/sh

# Set wallpaper
~/.fehbg &

# Set Pywal colors
wal -R

# Enable picom compositor
picom --experimental-backends --backend glx -b

# Set cursor to left_ptr
xsetroot -cursor_name left_ptr &

# Start notification daemon
dunst &

#Lock the screen on boot
betterlockscreen -l blur
