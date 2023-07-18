local lsp = {
    "neovim/nvim-lspconfig",

    -- dependencies = {
    --     { "mfussenegger/nvim-lint" },
    -- }

    config = function()
        -- lsp keymaps
        lsp_group = vim.api.nvim_create_augroup("Lsp", { clear = true })
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = 'LSP actions',
            callback = function(event)
                local map = vim.keymap.set
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "[l", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]l", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>lg", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end,
            group = lsp_group,
        })

        local signs = { Error = "E", Warn = "!", Hint = "*", Info = "i" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end
}

local mason = {
    "williamboman/mason.nvim",

    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
    },

    build = ":MasonUpdate",

    config = function()

        require('mason').setup({
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

        require('mason-lspconfig').setup({
            ensure_installed = {}
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                })
            end,
        })
    end,
}

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

return { lsp, mason }
