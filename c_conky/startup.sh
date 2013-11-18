#! /bin/sh

conky &
#conky -c ~/.config/conky/conkyrc_weather &
conky -c ~/.config/conky/conkyrc_net &
conky -c ~/.config/conky/conkyrc_disks &

exit 0
