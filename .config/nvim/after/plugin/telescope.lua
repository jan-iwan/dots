local ok, _ = pcall(require, "telescope")
if not ok then
    if not packer_installed then
        return
    end
    print("telescope not loaded")
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })

end)
