local treesitter = {
    "nvim-treesitter/nvim-treesitter",

    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "cpp", "python", "lua", "bash" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                disable = function(lang, buf)
                    local max_filesize = 1000 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end
}

local others = {
    -- colorize color codes
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            vim.opt.termguicolors = true

            DEFAULT_OPTIONS = {
                RGB      = true;  -- #RGB hex codes
                RRGGBB   = true;  -- #RRGGBB hex codes
                names    = false; -- "Name" codes like Blue
                RRGGBBAA = true;  -- #RRGGBBAA hex codes
                rgb_fn   = false; -- CSS rgb() and rgba() functions
                hsl_fn   = false; -- CSS hsl() and hsla() functions
                css      = false; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = false; -- Enable all CSS *functions*: rgb_fn, hsl_fn
                mode     = "background"; -- foreground / background.
            }

            -- sets autocommands
            require'colorizer'.setup()
        end,
    },

    -- indent mark
    { "lukas-reineke/indent-blankline.nvim" },

    -- colored parentheses
    -- { "p00f/nvim-ts-rainbow" }, -- abandoned :(

    -- close parentheses
    {
        "windwp/nvim-autopairs",
    },
    --     dependencies = {{ "nvim-treesitter" }},
    --     event = "InsertEnter",
    --     -- config = function()
    --     --     local npairs = require("nvim-autopairs")
    --     --     local Rule = require('nvim-autopairs.rule')
    --     --
    --     --     npairs.setup({
    --     --         check_ts = true,
    --     --         ts_config = {
    --     --             lua = {'string'},-- it will not add a pair on that treesitter node
    --     --             javascript = {'template_string'},
    --     --             java = false,-- don't check treesitter on java
    --     --         }
    --     --     })
    --     --
    --     --     local ts_conds = require('nvim-autopairs.ts-conds')
    --     --
    --     --
    --     --     -- press % => %% only while inside a comment or string
    --     --     npairs.add_rules({
    --     --         Rule("%", "%", "lua")
    --     --         :with_pair(ts_conds.is_ts_node({'string','comment'})),
    --     --         Rule("$", "$", "lua")
    --     --         :with_pair(ts_conds.is_not_ts_node({'function'}))
    --     --     })
    --     --
    --     --     -- do not add close pair if next char is a close pair
    --     --     require('nvim-autopairs').setup({
    --     --         enable_check_bracket_line = false
    --     --     })
    --     -- end
    -- },
}

return { treesitter, others }
