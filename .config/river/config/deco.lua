local wallpaper = {
    ["HDMI-A-1"] = "$HOME/z/img/bg.png",
    ["DP-3"] = "$HOME/z/img/bg.png",
}

local monitors = {
    ["HDMI-A-1"] = "--preferred --pos 0,0",
    ["DP-3"] = "--pos 1920,0",
}

local river_settings = {
    ["default-layout"] = "rivertile",

    ["xcursor-theme"] = "Simp1e-Gruvbox-Dark",

    ["background-color"] = "0x1d2021", -- #1d2021
    ["border-color-focused"] = "0x79740e", -- #79740e
    ["border-color-unfocused"] = "0x263640", -- #263640
    ["border-width"] = "1",
}

local filters = {
    -- floating windows
    ["float-filter-add"] = {
        ["app-id"] = {
            "alacrittyf",
            "FloatingWindow",
            "rofi",
            "Gimp",
            "thunar",
            "pavucontrol",
            "virt-manager",
            "vimiv",
            "python3",
            "foot",
        },
        ["title"] = {
            "Telegram",
            "",
        }
    },
    -- client side decorations
    ["csd-filter-add"] = {
        ["app-id"] = {
            "firefox",
        }
    },
}
-- riverctl rule add ssd -app-id "firefox"

-- gtk settings
local gsettings = {
    ["org.gnome.desktop.wm.preferences"] = {
        ["button-layout"] = "",
    },
    ["org.gnome.desktop.interface"] = {
        ["font-name"] = "Terminus 11",
        ["gtk-theme"] = "Klaus",
        ["icon-theme"] = "gruvbox-plus-icon-pack",
        ["cursor-theme"] = river_settings["xcursor-theme"],
    }
}


---- apply config ----

local fork_exec = require("config.fork_exec")

for monitor, image in pairs(wallpaper) do
    fork_exec("riverctl", {
        "spawn", "swaybg -o " .. monitor .. " -i " .. image
    })

end

local randr = "wlr-randr"

for monitor, settings in pairs(monitors) do
    randr = randr .. " --output " .. monitor .. " " .. settings
end

fork_exec("riverctl", { "spawn", randr })

for key, value in pairs(river_settings) do
    fork_exec("riverctl", { key, value })
end

for filter, types in pairs(filters) do
    for type, patterns in pairs(types) do
        for _, pattern in ipairs(patterns) do
            fork_exec("riverctl", { filter, type, pattern })
        end
    end
end

for schema, keys in pairs(gsettings) do
    for key, value in pairs(keys) do
        fork_exec("gsettings", { "set", schema, key, value })
    end
end
