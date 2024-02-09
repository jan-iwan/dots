local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local austuff = aug("austuff", { clear = true })

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
