#!/bin/bash

# use default pointer in X Server instead of x pointer
xsetroot -cursor_name left_ptr

# disable X beep
xset b off

# disable X blanking & display power management
xset s off
xset -dpms

# set the default background
feh --no-fehbg --bg-fill $HOME/Pictures/.wallpaper

# run autostart applications
dex -a &

# enable locker
xss-lock -l -q -- $HOME/.local/bin/lock &

# invoke global X session script
. /etc/X11/Xsession
