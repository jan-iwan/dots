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

        keys = { "<leader>gs", desc = "git" },
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },

    -- undo history
    {
        "mbbill/undotree",

        keys = { "<leader>u", desc = "undo tree" },
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    -- comment stuff
    {
        "numToStr/Comment.nvim",

        opts = {},
    },
}

return { plugins }
