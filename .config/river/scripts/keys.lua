local term = "foot"
local scrshot_store = "$HOME/Pictures/Screenshots/$(date +%F-%T).png"

local river = {
    {
        mod = { "Super" },
        key = "C",
        cmd = "close",
    },
    {
        mod = { "Super", "Shift" },
        key = "Q",
        cmd = "exit",
    },

    -- focus
    {
        mod = { "Super" },
        key = "J",
        cmd = "focus-view next",
    },
    {
        mod = { "Super" },
        key = "K",
        cmd = "focus-view previous",
    },
    {
        mod = { "Super", "Shift" },
        key = "J",
        cmd = "swap next",
    },
    {
        mod = { "Super", "Shift" },
        key = "K",
        cmd = "swap previous",
    },
    {
        mod = { "Super" },
        key = "Tab",
        cmd = "focus-previous-tags",
    },
    {
        mod = { "Super", "Shift" },
        key = "Tab",
        cmd = "send-to-previous-tags",
    },
    {
        mod = { "Super" },
        key = "U",
        cmd = "focus-output next",
    },
    {
        mod = { "Super", "Shift" },
        key = "U",
        cmd = "send-to-output next",
    },

    -- tiling
    {
        mod = { "Super" },
        key = "T",
        cmd = "toggle-float",
    },
    {
        mod = { "Super" },
        key = "Space",
        cmd = "toggle-fullscreen",
    },

    -- move views
    {
        mod = { "Super", "Alt" },
        key = "H",
        cmd = "move left 100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "J",
        cmd = "move down 100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "K",
        cmd = "move up 100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Alt" },
        key = "L",
        cmd = "move right 100",
        opt = "repeat"
    },

    -- snap views
    {
        mod = { "Super", "Shift", "Alt" },
        key = "H",
        cmd = "snap left",
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "J",
        cmd = "snap down",
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "K",
        cmd = "snap up",
    },
    {
        mod = { "Super", "Shift", "Alt" },
        key = "L",
        cmd = "snap right",
    },

    -- resize views
    {
        mod = { "Super", "Control" },
        key = "H",
        cmd = "resize horizontal -100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "J",
        cmd = "resize vertical 100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "K",
        cmd = "resize vertical -100",
        opt = "repeat"
    },
    {
        mod = { "Super", "Control" },
        key = "L",
        cmd = "resize horizontal 100",
        opt = "repeat"
    },

    -- layout (rivertile)
    {
        mod = { "Super" },
        key = "H",
        cmd = "send-layout-cmd rivertile \"main-ratio -0.05\"",
    },
    {
        mod = { "Super" },
        key = "L",
        cmd = "send-layout-cmd rivertile \"main-ratio +0.05\"",
    },
    {
        mod = { "Super", "Shift" },
        key = "H",
        cmd = "send-layout-cmd rivertile \"main-count +1\"",
    },
    {
        mod = { "Super", "Shift" },
        key = "L",
        cmd = "send-layout-cmd rivertile \"main-count -1\"",
    },
}

local mouse = {
    {
        mod = { "Super" },
        key = "BTN_LEFT",
        cmd = "move-view"
    },
    {
        mod = { "Super" },
        key = "BTN_RIGHT",
        cmd = "resize-view"
    },
}

local tags = {
    ["set-focused-tags"] = { "Super" },
    ["set-view-tags"] = { "Super", "Shift" },
    ["toggle-focused-tags"] = { "Super", "Control" },
    ["toggle-view-tags"] = { "Super", "Shift", "Control" },
}


------ apps ------

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
        mod = { "Super" },
        key = "P",
        cmd = "rofi -show run -monitor -1",
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
        mod = { "Super" },
        key = "Q",
        cmd = "killall waybar; waybar",
    },
    {
        key = "Print",
        cmd = "slurp | grim -g - " .. scrshot_store,
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
}

local function modstr(mods)
    if mods ~= nil then
        return table.concat(mods, "+")
    else
        return "None"
    end
end

local function keyopt(opt)
    if opt == nil then
        return ""
    else
        return "-" .. opt
    end
end

for key = 1, 9 do
    local tag_num = 1 << (key - 1)

    for cmd, mods in pairs(tags) do
        local mod = modstr(mods)

        os.execute(string.format(
        "riverctl map normal %s %s %s %s",
        mod, key, cmd, tag_num
        ))
    end
end

for _, keybind in ipairs(river) do
    local mod = modstr(keybind.mod)
    local opt = keyopt(keybind.opt)

    os.execute(string.format(
        "riverctl map %s normal %s %s %s",
        opt, mod, keybind.key, keybind.cmd
    ))
end

for _, keybind in ipairs(mouse) do
    local mod = modstr(keybind.mod)

    os.execute(string.format(
        "riverctl map-pointer normal %s %s %s",
        mod, keybind.key, keybind.cmd
    ))
end

for _, keybind in ipairs(apps) do
    local mod = modstr(keybind.mod)
    local opt = keyopt(keybind.opt)

    os.execute(string.format(
        "riverctl map %s normal %s %s spawn \"%s\"",
        opt, mod, keybind.key, keybind.cmd
    ))
end
