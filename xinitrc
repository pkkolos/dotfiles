#!/bin/bash
#
# ~/.xinitrc
#
# executed by startx

# update x resources db
xrdb -merge ~/.Xresources
# disable x beep
xset -b
# set the keyboard layout
setxkbmap -model pc105 -layout us,gr -variant altgr-intl,extended -option grp:lctrl_lshift_toggle
# set the default background
feh --bg-fill /home/panayiotis/Pictures/.wallpaper

# start the window manager
exec i3
