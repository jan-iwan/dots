local cmp = {
    "hrsh7th/nvim-cmp",

    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
    },

    -- event = "InsertEnter",

    config = function()
        local kind_icons = {
            Class = "class", Color = "color", Constant = "const",
            Constructor = "class()", Enum = "enum", EnumMember = "enum",
            Field = "field", File = "file", Folder = "file",
            Function = "func", Interface = "intf", Keyword = "key",
            Method = "method", Module = "lib", Property = "prop",
            Snippet = "snip", Struct = "struct", Text = "txt",
            Unit = "unit", Value = "value", Variable = "var",
        }

        local cmp = require("cmp")
        cmp.setup {
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "nvim_lua" },
            },
            mapping = {
                ["<C-b>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-k>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                },
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = kind_icons[vim_item.kind]
                        -- Source
                        vim_item.menu = ({
                            buffer = "[buf]",
                            nvim_lsp = "[lsp]",
                            luasnip = "[snip]",
                            nvim_lua = "[lua]",
                            path = "[path]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
            }

        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- local lspconfig = require("lspconfig")

        -- local servers = { "clangd", "pyright", }
        -- for _, lsp in ipairs(servers) do
        --     lspconfig[lsp].setup {
        --         -- on_attach = my_custom_on_attach,
        --         capabilities = capabilities,
        --     }
        -- end
    end
}

return cmp
