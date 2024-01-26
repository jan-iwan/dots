#!/bin/bash

local programs = {
    "waybar",

    -- redshift
    "gammastep -l -34:-58",

    -- turn off display after timeout
    "swayidle -w timeout 593 'wlopm --off *' resume 'wlopm --on *'" ,

    -- autostart desktop apps
    "dapper -u",

    -- notifications
    "dunst",

    "mpd $HOME/.config/mpd/mpd.conf",

    "wl-paste --watch cliphist store"
}

local cmd = require("cmd")

for _, program in ipairs(programs) do
    cmd.exec("riverctl", { "spawn", program })
end
