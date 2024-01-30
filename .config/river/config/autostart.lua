#!/bin/bash

local M = {}

local command = require("command")

local programs = {
    "waybar",

    -- redshift
    "gammastep -l -34:-58",

    -- turn off display after timeout
    "swayidle -w timeout 593 'wlopm --off \\*' resume 'wlopm --on \\*'" ,

    -- autostart desktop apps
    "dapper -u",

    -- notifications
    "dunst",

    "mpd $HOME/.config/mpd/mpd.conf",

    "wl-paste --watch cliphist store"
}

function M.start(restart)
    for _, program in ipairs(programs) do
        if restart ~= nil then
            -- get first word of the program (i.e. program name)
            -- and kill it
            command.exec("killall", { program:match("%w+") })
        end

        -- start the program
        command.exec("riverctl", { "spawn", program })
    end
end

return M
