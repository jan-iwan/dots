#!/bin/lua

require("scripts.autostart")
require("scripts.input")
require("scripts.keys")
require("scripts.deco")

local rivertile_opts = {
    "-view-padding", "0",
    "-outer-padding", "0",
    "-main-ratio", "0.5",
}

-- replace init with rivertile
require("posix.unistd").execp("rivertile", rivertile_opts)
