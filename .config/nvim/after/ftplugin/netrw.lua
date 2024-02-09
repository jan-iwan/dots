vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_banner = 0
-- ignore dotfiles by default
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+,]]

local ignore = {
    "aux", "log", "fls", "toc", "fdb_latexmk", "synctex.gz",
}

for _, ext in ipairs(ignore) do
    vim.g.netrw_list_hide = vim.g.netrw_list_hide .. [[.*\.]] .. ext .. [[,]]
end

local map = function(lhs, rhs)
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
