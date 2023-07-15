local ok, _ = pcall(require, "lsp-zero")

if not ok then
    return
end

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({ "clangd" })

local cmp = require("cmp")
--local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.setup_nvim_cmp({
  mapping = {
	["<C-b>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-k>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
  }
})

lsp.set_preferences({
    suggest_lsp_servers = false,

    -- disable default keymaps
    set_lsp_keymaps = false,

    -- i don't like icons
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'h',
        info = 'i'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

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
end)

lsp.setup()
