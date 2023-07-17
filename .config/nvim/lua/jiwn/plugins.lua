-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Hello world!")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local map = vim.keymap.set
local cmd = vim.cmd

local plugins = {
    -- colorscheme
    { "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("jiwn.colorscheme")
        end, },

    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-tree.lua", -- explorer
    "norcalli/nvim-colorizer.lua", -- colorize color codes
    "lukas-reineke/indent-blankline.nvim", -- indent mark
    "p00f/nvim-ts-rainbow", -- colored parentheses

    -- markdown wikis
    {"vimwiki/vimwiki",
        cmd = { "VimwikiIndex" },
        config = function()
            vim.g.vimwiki_list = {{
                path = "~/Documents/notes/",
                syntax = "markdown",
                ext = ".md"
            }}
        end },

    -- undo history
    { "mbbill/undotree",
        keys = { "<leader>u", desc = "undo tree" },
        config = function()
            map("n", "<leader>u", cmd.UndotreeToggle)
        end },

    -- git
    { "tpope/vim-fugitive",
        keys = { "<leader>Gs", desc = "git" },
        opts = { use_default_keymaps = true },
        config = function()
            map("n", "<leader>Gs", cmd.Git)
        end },

    -- close parentheses
    { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end },

    -- comment stuff
    { "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end },

    -- fuzzy finder
    { "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {{ "nvim-lua/plenary.nvim" }} },

    -- lsp
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim",
        build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",

    -- "mfussenegger/nvim-lint",

    -- cmp
    { "hrsh7th/nvim-cmp",
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-nvim-lua"},
            {"saadparwaiz1/cmp_luasnip"},
            {"L3MON4D3/LuaSnip"},},},

    -- latex
    { "lervag/vimtex",
        ft = { "tex" },
    config = function()
        vim.g.vimtex_view_method = "zathura"
    end},

    -- clangd extra features
    { "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp", "h", "hpp" }, },
}

-- lazy.nvim options
local opts = {
    install = {
        -- i prefer the default
        colorscheme = { "default" },
    },
    ui = {
        -- i don't like icons
        icons = {
            cmd = "[cmd]",
            config = "[cfg]",
            event = "[event]",
            ft = "[filetype]",
            init = "[init]",
            keys = "[keys]",
            plugin = "[depend]",
            runtime = "[rt]",
            source = "[src]",
            start = "[start]",
            task = "[task]",
            lazy = "[lazy]",
            loaded = "ok",
            not_loader = "no",
            list = {
                "o",
                "->",
                "*",
                "-",
            },
        },
    },
}

require("lazy").setup(plugins, opts)
