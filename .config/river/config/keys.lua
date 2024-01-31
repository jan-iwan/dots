local M = {}

local term = "foot"
local scripts = "$HOME/.config/river/scripts"
local screenshot = "$HOME/Pictures/Screenshots/$(date +%F-%T).png"

---- apps ----

local apps = {
    {
        mod = { "Super" },
        key = "Return",
        cmd = term,
    },
    {
        mod = { "Super" },
        key = "A",
        cmd = "rofi -show drun -show-icons -monitor -1",
    },
    {
        mod = { "Super", "Shift" },
        key = "Q",
        cmd = scripts .. "/rofi-powermenu",
    },
    {
        mod = { "Super" },
        key = "X",
        cmd = scripts .. "/rofi-clipboard",
    },
    {
        mod = { "Super" },
        key = "Q",
        cmd = scripts .. "/reload",
    },
    {
        mod = { "Super" },
        key = "P",
        cmd = scripts .. "/rofi-palette",
    },
    {
        mod = { "Super", "Shift" },
        key = "P",
        cmd = scripts .. "/color-picker",
    },
    {
        mod = { "Super" },
        key = "W",
        cmd = "firefox",
    },
    {
        mod = { "Super" },
        key = "E",
        cmd = "firefox -P $MY_FIREFOX_PROFILE",
    },
    {
        mod = { "Super" },
        key = "G",
        cmd = "gpu-chill",
    },
    {
        key = "Print",
        cmd = "slurp | grim -g - " .. screenshot,
    },
    {
        key = "XF86AudioRaiseVolume",
        cmd = "amixer -D pipewire set Master 5%+",
        opt = "repeat"
    },
    {
        key = "XF86AudioLowerVolume",
        cmd = "amixer -D pipewire set Master 5%-",
        opt = "repeat"
    },
    {
        key = "XF86AudioMute",
        cmd = "amixer -D pipewire set Master toggle",
    },
    {
        mod = { "Super" },
        key = "Slash",
        cmd = "mpc toggle -q",
    },

    -- notifications
    {
        mod = { "Super" },
        key = "apostrophe",
        cmd = "dunstctl close",
    },
    {
        mod = { "Super", "Shift" },
        key = "apostrophe",
        cmd = "dunstctl set-paused toggle",
    },
}

---- river keybindings ----

local river = {
    {
        mod = { "Super" },
        key = "C",
        cmd = { "close" },
    },
    {
        mod = { "Super", "Shift" },
        key = "O",
        cmd = { "exit" },
    },

    -- focus
    {
        mod = { "Super" },
        key = "J",
        cmd = { "focus-view", "next" },
    },
    {
        mod = { "Super" },
        key = "K",
        cmd = { "focus-view", "previous" },
    },
    {
        mod = { "Super", "Shift" },
        key = "J",
        cmd = { "swap", "next" },
    },
    {
        mod = { "Super", "Shift" },
        key = "K",
        cmd = { "swap", "previous" },
    },
    {
        mod = { "Super" },
        key = "Tab",
        cmd = { "focus-previous-tags" },
    },
    {
        mod = { "Super", "Shift" },
        key = "Tab",
        cmd = { "send-to-previous-tags" },
    },
    {
        mod = { "Super" },
        key = "U",
        cmd = { "focus-output", "next" },
    },
    {
        mod = { "Super", "Shift" },
        key = "U",
        cmd = { "send-to-output", "next" },
    },

    -- tiling
    {
        mod = { "Super" },
        key = "T",
        cmd = { "toggle-float" },
    },
    {
        mod = { "Super" },
        key = "Space",
        cmd = { "toggle-fullscreen" },
    },

    -- move views
    {
        mod = { "Super", "Alt" },
        key = "H",
        cmd = { "move", "left", "100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "J",
        cmd = { "move", "down", "100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "K",
        cmd = { "move", "up", "100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "L",
        cmd = { "move", "right", "100" },
        opt = "repeat"
    },

    -- snap views
    {
        mod = { "Super", "Shift", "Alt" },
        key = "H",
        cmd = { "snap", "left" },
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "J",
        cmd = { "snap", "down" },
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "K",
        cmd = { "snap", "up" },
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "L",
        cmd = { "snap", "right" },
    },

    -- resize views
    {
        mod = { "Super", "Control" },
        key = "H",
        cmd = { "resize", "horizontal", "-100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "J",
        cmd = { "resize", "vertical", "100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "K",
        cmd = { "resize", "vertical", "-100" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "L",
        cmd = { "resize", "horizontal", "100" },
        opt = "repeat"
    },

    -- layout (rivertile)
    {
        mod = { "Super" },
        key = "H",
        cmd = { "send-layout-cmd", "rivertile", "main-ratio -0.05" },
        opt = "repeat"
    },
    {
        mod = { "Super" },
        key = "L",
        cmd = { "send-layout-cmd", "rivertile", "main-ratio +0.05" },
        opt = "repeat"
    },
    {
        mod = { "Super", "Shift" },
        key = "H",
        cmd = { "send-layout-cmd", "rivertile", "main-count +1" },
    },
    {
        mod = { "Super", "Shift" },
        key = "L",
        cmd = { "send-layout-cmd", "rivertile", "main-count -1" },
    },
}

local mouse = {
    {
        mod = { "Super" },
        key = "BTN_LEFT",
        cmd = { "move-view" },
    },
    {
        mod = { "Super" },
        key = "BTN_RIGHT",
        cmd = { "resize-view" },
    },
}

local tags = {
    ["set-focused-tags"] = { "Super" },
    ["set-view-tags"] = { "Super", "Shift" },
    ["toggle-focused-tags"] = { "Super", "Control" },
    ["toggle-view-tags"] = { "Super", "Shift", "Control" },
}

local function modstr(mods)
    if mods ~= nil then
        return table.concat(mods, "+")
    else
        return "None"
    end
end

local command = require("command")

function M.apply()
    -- spawn apps
    for _, keybind in ipairs(apps) do
        local mod = modstr(keybind.mod)

        local opts = {}
        if keybind.opt == nil then
            opts = { "map", "normal", mod, keybind.key, "spawn", keybind.cmd }
        else
            opts = { "map", "-" .. keybind.opt, "normal", mod, keybind.key, "spawn", keybind.cmd }
        end

        command.exec("riverctl", opts)
    end

    -- tags
    -- local bit = require("bit") -- for luajit
    for key = 1, 9 do
        -- local tag_num = bit.lshift(1, key - 1)
        local tag_num = 1 << (key - 1)

        for cmd, mods in pairs(tags) do
            local mod = modstr(mods)

            command.exec("riverctl", { "map", "normal", mod, key, cmd, tag_num })
        end
    end

    -- river commands
    for _, keybind in ipairs(river) do
        local mod = modstr(keybind.mod)

        -- keybind.cmd is added separately
        local opts = {}
        if keybind.opt == nil then
            opts = { "map", "normal", mod, keybind.key }
        else
            opts = { "map", "-" .. keybind.opt, "normal", mod, keybind.key }
        end

        -- separate cmd words
        for _, cmd in ipairs(keybind.cmd) do
            table.insert(opts, cmd)
        end

        command.exec("riverctl", opts)
    end

    -- river commands with mouse
    for _, keybind in ipairs(mouse) do
        local mod = modstr(keybind.mod)
        local opts = { "map-pointer", "normal", mod, keybind.key }

        -- separate cmd words
        for _, cmd in ipairs(keybind.cmd) do
            table.insert(opts, cmd)
        end

        command.exec("riverctl", opts)
    end
end

return M
