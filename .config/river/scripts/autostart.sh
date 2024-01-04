#!/bin/bash

waybar &

mpd $HOME/.config/mpd/mpd.conf

# app autostart 
dapper -u &

# notifications
dunst &

# turn off display after timeout
swayidle -w timeout 593 'wlopm --off \*' resume 'wlopm --on \*' &

# redshift
exec gammastep -l -34:-58
