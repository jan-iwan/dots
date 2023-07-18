local lsp_zero = {
    "VonHeikemen/lsp-zero.nvim",

    branch = "v2.x",
    lazy = true,

    config = function()
        require('lsp-zero.settings').preset({})
    end,
}

local lsp_config = {
    "neovim/nvim-lspconfig" ,

    cmp = "LspInfo",
    event = {"BufReadPre", "BufNewFile"},

    dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "williamboman/mason-lspconfig.nvim" },
        {
            "williamboman/mason.nvim",
            build = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
        },
    },

    config = function()
        local lsp = require("lsp-zero").preset({})

        lsp.on_attach(function(client, bufnr)
            local map = vim.keymap.set
            local opts = { buffer = bufnr }

            -- "l" for lsp
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "[l", vim.diagnostic.goto_next, opts)
            map("n", "]l", vim.diagnostic.goto_prev, opts)
            map("n", "<leader>ld", vim.lsp.buf.definition, opts)
            map("n", "<leader>lD", vim.lsp.buf.declaration, opts)
            map("n", "<leader>li", vim.lsp.buf.implementation, opts)
            map("n", "<leader>lg", vim.diagnostic.open_float, opts)
            map("n", "<leader>lca", vim.lsp.buf.code_action, opts)
            map("n", "<leader>lrr", vim.lsp.buf.references, opts)
            map("n", "<leader>lrn", vim.lsp.buf.rename, opts)
            map("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts)
            map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end)

        lsp.set_sign_icons({
            error = "E", warn = "!", hint = "*", info = "i",
        })

        vim.diagnostic.config({ virtual_text = false })

        lsp.setup()

        vim.keymap.set("n", "<leader>lm", vim.cmd.Mason)
        require("mason").setup({
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
        })

        require("mason-lspconfig").setup()
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

return { lsp_zero, lsp_config, specific }
