#!/bin/bash

# keyboard
riverctl set-repeat 50 300

# layout
riverctl keyboard-layout -variant altgr-intl -options nodeadkeys us

# mouse
riverctl input pointer-1133-16500-Logitech_G305 accel-profile flat
riverctl input pointer-1133-16500-Logitech_G305 pointer-accel -0.5
riverctl focus-follows-cursor disabled
