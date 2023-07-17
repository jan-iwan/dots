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

local plugins = {
    -- colorscheme
    { "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
        end, },

    "nvim-treesitter/nvim-treesitter",
    "mbbill/undotree", -- undo history
    "lervag/vimtex", -- latex
    "tpope/vim-fugitive", -- git
    "nvim-tree/nvim-tree.lua", -- utils
    "vimwiki/vimwiki",

    -- ui
    "norcalli/nvim-colorizer.lua", -- colorize color codes
    "p00f/nvim-ts-rainbow", -- colored parentheses
    "lukas-reineke/indent-blankline.nvim", -- indent mark

    -- lsp
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- "mfussenegger/nvim-lint",

    "p00f/clangd_extensions.nvim", -- clangd extra features

    -- cmp
    { "hrsh7th/nvim-cmp",
    dependencies = {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"saadparwaiz1/cmp_luasnip"},
        {"L3MON4D3/LuaSnip"}} },

    -- "hrsh7th/cmp-nvim-lua",
    -- "rafamadriz/friendly-snippets",

    { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end },
    { "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end },
    { "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {{ "nvim-lua/plenary.nvim" }} },
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
            ft = "[ft]",
            init = "[init]",
            keys = "[keys]",
            plugin = "[plug]",
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
