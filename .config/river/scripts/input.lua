-- mouse device name (run `riverctl list-inputs` to find it)
local mouse = "pointer-1133-16500-Logitech_G305"

local input_settings = {
    -- keyboard
    ["set-repeat"] = "50 300",
    ["keyboard-layout"] = "-variant altgr-intl -options nodeadkeys us",

    -- mouse
    ["input " .. mouse] = "accel-profile flat",
    ["input " .. mouse] = "pointer-accel -0.5",
    ["focus-follows-cursor"] = "disabled",
    ["hide-cursor timeout"] = "27953",
}

for key, value in pairs(input_settings) do
    os.execute(string.format("riverctl %s %s", key, value))
end
