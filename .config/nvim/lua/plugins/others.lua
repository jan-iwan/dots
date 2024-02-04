local plugins = {
    {
        "tpope/vim-fugitive",
        keys = {{ "<leader>gs", vim.cmd.Git }, desc = "git" },
    },

    -- undo history
    {
        "mbbill/undotree",
        keys = {{ "<leader>u", vim.cmd.UndotreeToggle }, desc = "undo tree" },
    },
}

return plugins
