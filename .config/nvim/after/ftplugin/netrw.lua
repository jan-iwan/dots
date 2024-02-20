-- global options cannot be set up here
-- they need to in lua/config/options.lua for some reason
-- otherwise toggling hidden files will not work (idk why)

local function map(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
end

map("<Esc>", vim.cmd.bdelete)
map("H", "u")        -- previous
map("h", "-^")       -- up dir
map("l", "<CR>")     -- enter
map(".", "gh")       -- hidden files
map("P", "<C-w>z")   -- close preview ('p' to open)
map("<tab>", "mf")   -- mark a file
map("<S-tab>", "mF") -- unmark all in current buffer
map("<A-tab>", "mu") -- unmark all
