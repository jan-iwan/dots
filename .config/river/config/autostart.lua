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
}

local fork_exec = require("config.fork_exec")

-- if require("posix.unistd").getenv("") then
-- end

for _, program in ipairs(programs) do
    fork_exec("riverctl", { "spawn", program })
end
