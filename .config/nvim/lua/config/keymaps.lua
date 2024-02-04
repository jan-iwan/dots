local map = vim.keymap.set
local g = vim.g
local cmd = vim.cmd

g.mapleader = " "
g.maplocalleader = " "

--# normal mode #--

map("n", ";w", ":w<cr>")
map("n", ";q", ":q<cr>")
map("n", ";Q", ":qall<cr>")
map("n", "<leader>e", cmd.Lexplore)

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- window size
map("n", "<C-A-k>", ":resize -2<CR>")
map("n", "<C-A-j>", ":resize +2<CR>")
map("n", "<C-A-h>", ":vertical resize -2<CR>")
map("n", "<C-A-l>", ":vertical resize +2<CR>")

-- terminal window
map("n", "<C-t>", "<Esc>:split<cr>:resize 10<cr>:set nonumber<cr>:terminal<cr>")

-- buffers
map("n", "<leader>c", cmd.bdelete)
map("n", "<S-l>", cmd.bnext)
map("n", "<S-h>", cmd.bprevious)

-- move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==")
map("n", "<A-k>", "<Esc>:m .-2<CR>==")


--# visual mode #--

-- for indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- move text up and down
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m .+1<CR>==")

-- pasted stuff stays in clipboard
map("v", "p", '"_dP')


--# visual block mode #--

-- move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")


--# terminal mode #--

-- window navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
