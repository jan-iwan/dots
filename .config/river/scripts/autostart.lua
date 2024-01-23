#!/bin/bash

local programs = {
    "waybar",

    -- redshift
    "gammastep -l -34:-58",

    -- turn off display after timeout
    "swayidle -w timeout 593 \'wlopm --off \\*\' resume \'wlopm --on \\*\'" ,

    -- autostart desktop apps
    "dapper -u",

    -- notifications
    "dunst",

    "mpd $HOME/.config/mpd/mpd.conf",

    -- "wlr-randr --output HDMI-A-1 --pos 0,0 --output DP-3 --pos 1920,0",
}


for _, program in ipairs(programs) do
    os.execute(string.format("riverctl spawn \"%s\"", program))
end
