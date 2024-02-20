-- undo history
local undo = {
    "mbbill/undotree",
    keys = { { "<leader>u", vim.cmd.UndotreeToggle }, desc = "undo tree" },
}

return undo
