#!/bin/bash

local M = {}

local command = require("command")

local programs = {
    -- Status bar
    "waybar --log-level error",

    -- redshift
    "gammastep -l -34:-58",

    -- Turn off display after timeout
    "swayidle -w timeout 1111 'wlopm --off \\*' resume 'wlopm --on \\*'",

    -- Autostart desktop apps
    "dex -a",

    -- Notifications
    "dunst",

    -- Music (i rarely use this)
    "mpd $HOME/.config/mpd/mpd.conf",

    -- Clipboard history
    "wl-paste --watch cliphist store"
}

function M.setup(opts)
    for _, program in ipairs(programs) do
        if opts.restart == true then
            -- Get first word of the program (i.e. program name)
            -- and kill it
            command.exec("killall", { program:match("%w+") }, true)
            -- I should probably keep some list of PIDs instead of doing this
        end

        -- start the program
        command.exec("riverctl", { "spawn", program })
    end
end

return M
