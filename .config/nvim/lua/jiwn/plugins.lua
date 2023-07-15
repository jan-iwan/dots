-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- plugins
local plugins = {
    "nvim-treesitter/nvim-treesitter",

    "mbbill/undotree",
    "lervag/vimtex",
    "tpope/vim-fugitive", -- git
    "nvim-tree/nvim-tree.lua", -- utils
    -- "terrortylor/nvim-comment",
    "vimwiki/vimwiki",
    -- ui
    "ellisonleao/gruvbox.nvim",
    "norcalli/nvim-colorizer.lua", -- colorize color codes
    "p00f/nvim-ts-rainbow", -- colored parentheses
    "lukas-reineke/indent-blankline.nvim", -- indent mark
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {{ "nvim-lua/plenary.nvim" }}
    },
    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
