-- file explorer
local nvim_tree = {
    "nvim-tree/nvim-tree.lua",

    -- keys = { { "<leader>e", vim.cmd.NvimTreeToggle }, desc = "Nvim Tree" },

    config = function()
        vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 24,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })

        -- open at startup
        local function open_nvim_tree(data)

            -- buffer is a directory
            local directory = vim.fn.isdirectory(data.file) == 1

            if not directory then
                return
            end

            -- change to the directory
            vim.cmd.cd(data.file)

            -- open the tree
            require("nvim-tree.api").tree.open()
        end

        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
}

return nvim_tree
