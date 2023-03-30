-- when opening nvim for the first time
packer_installed, _ = pcall(require, "packer")
if not packer_installed then
    function install_packer()
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        print("Installed packer")
        print("Reopen nvim and run `:PackerSync`")
        vim.cmd [[packadd packer.nvim]]
    end
end
    print("Packer is not installed")
    print("Run `:lua install_packer()`")
    return
end

-- floating window
require("packer").init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- plugins
return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.0",
		-- or                            , branch = "0.1.x",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

	use("mbbill/undotree")

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
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
	}
	-- git
	use("tpope/vim-fugitive")

    -- utils
    use("nvim-tree/nvim-tree.lua")
    use("terrortylor/nvim-comment")
    use("vimwiki/vimwiki")
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

	-- ui
	use("ellisonleao/gruvbox.nvim")
    use("norcalli/nvim-colorizer.lua") -- colorize color codes
    use("p00f/nvim-ts-rainbow") -- colored parentheses
    use("lukas-reineke/indent-blankline.nvim") -- indent mark

end)
