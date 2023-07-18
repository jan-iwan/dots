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

    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        -- { "rafamadriz/friendly-snippets" },
    },

    config = function()
        require("lsp-zero.cmp").extend()

        local cmp = require("cmp")
        local cmp_action = require("lsp-zero.cmp").action()

        cmp.setup({
            mapping = {
                ["<C-k>"] = cmp.mapping.confirm({select = false}),
                ["<C-b>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

                ["<C-m>"] = cmp.mapping.abort(),

                -- navigate documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),

                -- navigate between snippet placeholder
                ["<Tab>"] = cmp_action.luasnip_jump_forward(),
                ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer", keyword_length = 4 },
                { name = "luasnip", keyword_length = 2 },
                { name = "nvim_lua" }, -- lua for nvim
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                documentation = { max_height = 32, max_width = 32, },
            },
            formatting = {
                fields = {"abbr", "kind", "menu"},
                format = function(entry, item)
                    -- kind icons
                    item.kind = kind_icons[item.kind]

                    -- limit cmp window width
                    local content = item.abbr
                    local W_MAX = 28
                    if #content > W_MAX then
                        item.abbr = vim.fn.strcharpart(content, 0, W_MAX) .. "..."
                    else
                        item.abbr = content .. (" "):rep(W_MAX - #content)
                    end

                    local short_name = {
                        buffer = "buf",
                        nvim_lsp = "lsp",
                        nvim_lua = "nvim",
                        path = "path",
                    }

                    local menu_name = short_name[entry.source.name] or entry.source.name
                    item.menu = string.format("[%s]", menu_name)

                    return item
                end,
            }
        })
    end
}

return cmp
