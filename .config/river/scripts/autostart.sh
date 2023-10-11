#!/bin/bash

waybar &
mpd $HOME/.config/mpd/mpd.conf
dapper -u &
dunst &

exec gammastep -l -34:-58
