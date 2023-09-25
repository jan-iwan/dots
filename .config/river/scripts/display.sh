#!/bin/bash

# wlr-randr --output HDMI-A-1 --pos 0,0 --output DP-3 --pos 1920,0
kanshi &

swaybg -o HDMI-A-1 -i $HOME/z/img/bg.png &
swaybg -o DP-3     -i $HOME/z/img/bg.png &
