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
vim.opt.showtabline = 1
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.pumheight = 24

vim.opt.updatetime = 476

vim.opt.splitbelow = true

vim.opt.conceallevel = 3

vim.opt.textwidth = 80

-- for obsidian.nvim
vim.opt.conceallevel = 2

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+,.*\.aux,.*\.log,.*\.fls,.*\.toc,.*\.fdb_latexmk,.*\.synctex.gz]]
