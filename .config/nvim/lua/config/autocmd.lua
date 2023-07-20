au = vim.api.nvim_create_autocmd
aug = vim.api.nvim_create_augroup

local austuff = aug("austuff", { clear = true })
local file_types = aug("file_types", { clear = true })
local netrw = aug("netrw_keys", {clear = true})

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

au("FileType", {
    pattern = "netrw",
    callback = function()
        local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
        end

        map("<Esc>", vim.cmd.bdelete)
        map("H", "u") -- previous
        map("h", "-^") -- up dir
        map("l", "<cr>") -- enter
        map(".", "gh") -- hidden files
        map("P", "<C-w>z") -- close preview
        map("<tab>", "mf") -- mark a file
        map("<S-tab>", "mF") -- unmark all in current buffer
        map("<A-tab>", "mu") -- unmark all
    end,
    group = netrw_keys,
})
