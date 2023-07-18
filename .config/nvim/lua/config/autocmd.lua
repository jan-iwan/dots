au = vim.api.nvim_create_autocmd
aug = vim.api.nvim_create_augroup

local austuff = aug("austuff", { clear = true })
local file_types = aug("file_types", { clear = true })

au("BufWinEnter", {
    desc = "no autocomment on new line",
    command = "set formatoptions-=cro",
    group = austuff,
})
au("TextYankPost", {
    desc = "Highlight yank",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = austuff
})
au("VimResized", {
    desc = "autoresize split",
    command = "tabdo wincmd =",
    group = austuff,
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
    group = file_types,
})
