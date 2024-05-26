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

    -- Autostart desktop entries (~/.config/autostart/, etc.)
    "dex -a",

    -- Notifications
    "dunst",

    -- Music (i rarely use this)
    "mpd $HOME/.config/mpd/mpd.conf",

    -- Clipboard history
    "wl-paste --watch cliphist store"
}

local function kill(program)
    -- Get first word of the program (i.e. program name)
    -- and kill it
    command.exec(
        "killall",
        { program:match("%w+") },
        { wait = true }
    )

    -- I should probably keep some list of PIDs instead of doing this
    -- Maybe not, idk
end

function M.setup(opts)
    opts = opts or {}

    for _, program in ipairs(programs) do
        if opts.restart == true then
            kill(program)
        end

        -- start the program
        command.exec(
            "riverctl",
            { "spawn", program }
        )
    end
end

return M
