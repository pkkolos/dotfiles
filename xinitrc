#!/bin/bash

# use default pointer in X Server instead of x pointer
xsetroot -cursor_name left_ptr

# update X resources db
xrdb -merge ~/.Xresources

# disable X beep
xset b off

# disable X blanking & display power management
xset s off
xset -dpms

# set the keyboard layout
#setxkbmap -model pc105 -layout us,gr -variant altgr-intl,extended
#setxkbmap -option grp:win_space_toggle,grp_led:scroll,lv3:ralt_switch,compose:rwin,terminate:ctrl_alt_bksp

# set the default background
feh --no-fehbg --bg-fill $HOME/Pictures/.wallpaper

# run autostart applications
dex -a &

# enable locker
xss-lock -l -q -- $HOME/.local/bin/lock &

# run X compositor
picom &

# run notification daemon
dunst &

# run X hotkey daemon
sxhkd &

# invoke global X session script
. /etc/X11/Xsession

# start the window manager
exec bspwm
