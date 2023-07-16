-- highlight yank, autoresize window, etc

au = vim.api.nvim_create_autocmd
aug = vim.api.nvim_create_augroup

local sitelen_wawa = aug("sitelen_wawa", { clear = true })
local file_types = aug("file_types", { clear = true })
local auto_resize = aug("auto_resize", { clear = true })
local git = aug("git", { clear = true })

au("BufWinEnter", {
    command = "set formatoptions-=cro",
    group = sitelen_wawa,
})
au("TextYankPost", {
    -- command = "lua vim.highlight.on_yank()",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = sitelen_wawa
})

au("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd("setlocal wrap")
        vim.cmd("setlocal spelllang=en,es")
        vim.cmd("setlocal spell")
    end,
    group = file_types,
})

au("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.cmd("setlocal wrap")
        vim.cmd("setlocal spell")
    end,
})

vim.cmd [[
    augroup _auto_resize
        autocmd!
        autocmd VimResized * tabdo wincmd = 
    augroup end
]]
