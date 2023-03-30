#!/bin/bash

picom --experimental-backends &
nitrogen --restore &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand false --width 5 --transparent true --alpha 0 --tint 0x1d2021 --height 18 &
xsetroot -cursor_name left_ptr &
