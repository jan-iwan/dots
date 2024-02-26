-- for all languages
local all = {
    {
        "nvim-treesitter/nvim-treesitter",

        event = { "BufReadPre", "BufNewFile" },

        build = ":TSUpdate",

        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = {
                    "c", "cpp", "python", "lua", "bash", "markdown", "markdown_inline",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,

                    disable = function(lang, buf)
                        local max_filesize = 1000 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            print("Large file! Disabling Treesitter.")
                            return true
                        end
                    end,

                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- set to `false` to disable one of the mappings
                        init_selection = "gn",
                        node_incremental = "gn",
                        scope_incremental = false,
                        node_decremental = "gb",
                    },
                },
            }
        end
    },

    -- colorize color codes
    {
        "norcalli/nvim-colorizer.lua",

        event = { "BufReadPre", "InsertEnter" },
        config = function()
            vim.opt.termguicolors = true

            DEFAULT_OPTIONS = {
                RGB      = true,         -- #RGB hex codes
                RRGGBB   = true,         -- #RRGGBB hex codes
                names    = false,        -- "Name" codes like Blue
                RRGGBBAA = true,         -- #RRGGBBAA hex codes
                rgb_fn   = false,        -- CSS rgb() and rgba() functions
                hsl_fn   = false,        -- CSS hsl() and hsla() functions
                css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                mode     = "background", -- foreground / background.
            }

            -- sets autocommands
            require 'colorizer'.setup()
        end,
    },

    -- comment stuff
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "InsertEnter" },
        opts = {
            -- ignore blank lines
            ignore = "^$",
        },
    },

    -- close parentheses
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},

    },
}

local language_specific = {
    -- latex
    {
        "lervag/vimtex",
        ft = { "tex" },
        config = function()
            vim.g.vimtex_view_method = "zathura"

            require 'nvim-treesitter.configs'.setup({
                highlight = {
                    enable = false,
                },
            })
        end
    },

    {
        "preservim/vim-pencil",
        ft = "markdown",
    },
}

return { all, language_specific }
