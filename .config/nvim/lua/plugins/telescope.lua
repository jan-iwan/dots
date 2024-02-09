-- fuzzy finder
local telescope = {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
    },

    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        require("telescope").load_extension("undo")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, {})
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>f;", builtin.commands, {})
        vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", {})

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["C-j"] = actions.cycle_history_next,
                        ["C-k"] = actions.cycle_history_prev,
                    }
                }
            }
        })
    end,
}

return telescope
