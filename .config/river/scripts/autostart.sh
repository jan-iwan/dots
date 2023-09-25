#!/bin/bash

mpd $HOME/.config/mpd/mpd.conf
waybar &
dapper -u &
dunst &

exec gammastep -l -34:-58
