-- markdown wikis
local vimwiki = {
    "vimwiki/vimwiki",

    cmd = { "VimwikiIndex" },
    init = function()
        vim.g.vimwiki_list = {{
            path = "~/Documents/notes/",
            syntax = "markdown",
            ext = ".md"
        }}
    end
}

local git = {
    "tpope/vim-fugitive",

    keys = { "<leader>gs", desc = "git" },
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}

-- undo history
local undo_tree = {
    "mbbill/undotree",

    keys = { "<leader>u", desc = "undo tree" },
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}

-- comment stuff
local comment = {
    "numToStr/Comment.nvim",

    config = function()
        require('Comment').setup()
    end
}

return { vimwiki, git, undo_tree, comment }
