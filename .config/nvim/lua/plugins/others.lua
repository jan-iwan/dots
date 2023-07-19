local plugins = {

    -- markdown wikis
    {
        "vimwiki/vimwiki",

        cmd = { "VimwikiIndex" },
        init = function()
            vim.g.vimwiki_list = {{
                path = "~/Documents/notes/",
                syntax = "markdown",
                ext = ".md"
            }}
        end
    },

    {
        "tpope/vim-fugitive",
        keys = { { "<leader>gs", vim.cmd.Git }, desc = "git" },
    },

    -- undo history
    {
        "mbbill/undotree",
        keys = { { "<leader>u", vim.cmd.UndotreeToggle }, desc = "undo tree" },
    },

    -- comment stuff
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "InsertEnter" },
        opts = {},
    },
}

return { plugins }
