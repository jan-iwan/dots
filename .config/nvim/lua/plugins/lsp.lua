-- This was done with a lot of help from lsp-zero's migrate away guide:
-- https://github.com/VonHeikemen/lsp-zero.nvim/

local lsp_config = {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo" },
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason.nvim" },
    },

    config = function()
        vim.diagnostic.config({ virtual_text = false })

        local map = vim.keymap.set

        -- diagnostics are not exclusive to lsp servers
        map("n", "<leader>lg", vim.diagnostic.open_float)
        map("n", "[l", vim.diagnostic.goto_next)
        map("n", "]l", vim.diagnostic.goto_prev)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            desc = "LSP actions",
            callback = function(event)
                -- buffer-local keymaps
                local opts = { buffer = event.buf }

                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "gi", vim.lsp.buf.implementation, opts)
                map("n", "go", vim.lsp.buf.type_definition, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("i", "gs", vim.lsp.buf.signature_help, opts)
                map("n", "<F2>", vim.lsp.buf.rename, opts)
                map("n", "<F4>", vim.lsp.buf.code_action, opts)
                map({ "n", "x" }, "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end
        })
    end
}

local mason = {
    "williamboman/mason.nvim",

    cmd = { "Mason" },
    keys = { { "<leader>lm", vim.cmd.Mason }, desc = "Mason" },

    dependencies = {
        { "neovim/nvim-lspconfig" },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {},
        },
    },

    build = function()
        pcall(vim.cmd, "MasonUpdate")
    end,

    opts = {
        ui = {
            icons = {
                package_installed = "ok",
                package_pending = "...",
                package_uninstalled = "x",
            },
        },
        keymaps = {
            cancel_installation = "x",
        },
    },

    config = function()
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local default_setup = function(server)
            require("lspconfig")[server].setup({
                capabilities = lsp_capabilities,
            })
        end

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {},
            handlers = {
                default_setup,
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = { diagnostics = { globals = { "vim" } }, },
                        },
                    })
                end
            },
        })
    end
}

-- language specific extras
local specific = {
    -- latex
    {
        "lervag/vimtex",
        ft = { "tex" },
        config = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },

    -- c, c++
    {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp", "h", "hpp" },
    },
}

return { lsp_config, mason, specific }
