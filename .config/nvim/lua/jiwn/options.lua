
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showtabline = 2
vim.opt.smartindent = true


vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.pumheight = 10

vim.opt.updatetime = 50

vim.opt.splitbelow = true

vim.opt.conceallevel = 0

--vim.opt.fileencoding = "utf-8"

if not packer_installed then
    vim.opt.termguicolors = false
    vim.opt.cursorline = false
    vim.opt.signcolumn = "no"
end
