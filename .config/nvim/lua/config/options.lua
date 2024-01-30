local opt = vim.opt
local g = vim.g

opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.showtabline = 2
opt.smartindent = true


opt.hlsearch = false
opt.incsearch = true
opt.smartcase = true

opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.pumheight = 24

opt.updatetime = 476

opt.splitbelow = true

opt.conceallevel = 0

opt.textwidth = 80

g.netrw_keepdir = 0
g.netrw_localcopydircmd = "cp -r"
g.netrw_banner = 0
g.netrw_winsize = 30
