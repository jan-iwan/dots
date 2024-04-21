local M = {}

local wallpaper = {
    ["HDMI-A-1"] = "$HOME/z/img/bg.png",
    ["DP-3"] = "$HOME/z/img/bg.png",
}

local monitors = nil

local river_settings = {
    ["default-layout"] = "rivertile",

    ["xcursor-theme"] = "Simp1e-Gruvbox-Dark",

    ["background-color"] = "0x1d2021",       -- #1d2021
    ["border-color-focused"] = "0x79740e",   -- #79740e
    ["border-color-unfocused"] = "0x263640", -- #263640
    ["border-color-urgent"] = "0xb16282",    -- #b16282
    ["border-width"] = "1",
}

local rules = {
    -- floating windows
    ["float"] = {
        ["-app-id"] = {
            "foot",
            "FloatingWindow",
            "rofi",
            "Gimp",
            "thunar",
            "pavucontrol",
            "virt-manager",
            "imv",
            "mpv",
            "python3", -- for matplotlib
        },
        ["-title"] = {
            "Telegram",
            "Helm",
            "",
        }
    },
    -- client side decorations
    ["ssd"] = {
        ["-app-id"] = {
            "firefox"
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
        ["font-antialiasing"] = "grayscale",
    }
}


---- apply config ----

local command = require("command")

function M.setup(opts)
    if opts.restart == true then
        command.exec("killall", { "swaybg" })
    end

    for monitor, image in pairs(wallpaper) do
        command.exec("riverctl", {
            "spawn", "swaybg -o " .. monitor .. " -i " .. image
        })
    end

    if monitors ~= nil then
        local randr = "wlr-randr"
        for monitor, settings in pairs(monitors) do
            randr = randr .. " --output " .. monitor .. " " .. settings
        end
        command.exec("riverctl", { "spawn", randr })
    end

    for key, value in pairs(river_settings) do
        command.exec("riverctl", { key, value })
    end

    for action, id_types in pairs(rules) do
        for id_type, ids in pairs(id_types) do
            for _, id in ipairs(ids) do
                command.exec("riverctl", { "rule-add", id_type, id, action })
            end
        end
    end

    for schema, keys in pairs(gsettings) do
        for key, value in pairs(keys) do
            command.exec("gsettings", { "set", schema, key, value })
        end
    end
end

return M
