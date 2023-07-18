-- markdown wikis
local vimwiki = {
    "vimwiki/vimwiki",

    cmd = { "VimwikiIndex" },
    config = function()
        vim.g.vimwiki_list = {{
            path = "~/Documents/notes/",
            syntax = "markdown",
            ext = ".md"
        }}
    end
}

local git = {
    "tpope/vim-fugitive",

    keys = { "<leader>Gs", desc = "git" },
    opts = { use_default_keymaps = true },
    config = function()
        vim.keymap.set("n", "<leader>Gs", cmd.Git)
    end
}

-- undo history
local undo_tree = {
    "mbbill/undotree",

    keys = { "<leader>u", desc = "undo tree" },
    config = function()
        vim.keymap.set("n", "<leader>u", cmd.UndotreeToggle)
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
