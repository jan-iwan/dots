-- instead of icons in completion menu
local kind_icons = {
    Class = "class", Color = "color", Constant = "const",
    Constructor = "class()", Enum = "enum", EnumMember = "enum",
    Field = "field", File = "file", Folder = "file",
    Function = "func", Interface = "intf", Keyword = "key",
    Method = "method", Module = "lib", Property = "prop",
    Snippet = "snip", Struct = "struct", Text = "txt",
    Unit = "unit", Value = "value", Variable = "var",
}

local cmp = {
    "hrsh7th/nvim-cmp",

    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
    },

    config = function()
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero.cmp").action()

        -- cmp is enabled by default
        local enable = true
        -- but it can be disabled by with this keymap
        vim.keymap.set("n", "<leader>lC",
        function()
            enable = not enable
            cmp.setup({enabled = enable})
        end)

        cmp.setup({
            mapping = {
                ["<C-k>"] = cmp.mapping.confirm({select = false}),
                ["<C-j>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-l>"] = cmp.mapping.select_next_item(cmp_select),

                ["<C-h>"] = cmp.mapping.abort(),

                -- navigate between snippet placeholder
                ["<Tab>"] = cmp_action.luasnip_jump_forward(),
                ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),

                -- navigate documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer", keyword_length = 4 },
                { name = "path" },
                { name = "nvim_lua" }, -- lua for nvim
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                -- limit docs size
                documentation = { max_height = 32, max_width = 32, },
            },
            formatting = {
                fields = {"abbr", "kind", "menu"},
                format = function(entry, item)
                    -- kind icons
                    item.kind = kind_icons[item.kind]

                    -- limit cmp window width
                    local content = item.abbr
                    local W_MAX = 20
                    if #content > W_MAX then
                        item.abbr = vim.fn.strcharpart(content, 0, W_MAX) .. "..."
                    else
                        item.abbr = content .. (" "):rep(W_MAX - #content)
                    end

                    local short_name = {
                        buffer = "buf",
                        nvim_lsp = "lsp",
                        nvim_lua = "vim",
                        path = "path",
                        luasnip = "sinp",
                    }

                    local menu_name = short_name[entry.source.name] or entry.source.name
                    item.menu = string.format("[%s]", menu_name)

                    return item
                end,
            },
            -- preselect first item
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
        })
    end
}

local snippets = {
    "L3MON4D3/LuaSnip",
    dependencies = {{ "rafamadriz/friendly-snippets" }},
    build = "make install_jsregexp",
    version = "v2.*",
    config = function()
        -- for friendly-snippets (VS Code-like)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- SnipMate-like snippets
        -- require("luasnip.loaders.from_snipmate").lazy_load()

        -- load lua snippets
        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/lua/snippets"
        })

        local ls = require("luasnip")

        ls.config.set_config({
            -- remember to keep around the last snippet
            history = true,

            -- autoexpand some snippets
            enable_autosnippets = true,

            -- dynamic snippets that update while typing
            updateevents = "TextChanged,TextChangedI",

            store_selection_keys = "<C-e>",
        })

        -- for choice nodes
        vim.keymap.set({ "i", "s" }, "<C-n>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)
    end
}


-- what i used for latex snippets
-- local ultisnips = {
--     "SirVer/ultisnips",
--
--     ft = { "tex" },
--
--     init = function()
--         -- vim.g.UltiSnipsExpandTrigger = "<tab>"
--         vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
--         vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
--         -- vim.g.UltiSnipsEditSplit = "vertical"
--     end,
-- }

return { cmp, snippets }
