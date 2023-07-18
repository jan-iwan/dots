local map = vim.keymap.set
local g = vim.g
local cmd = vim.cmd

g.mapleader = " "
g.maplocalleader = " "

--# normal mode #--

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
map("n", ";w", ":w<cr>")
map("n", ";q", ":q<cr>")
-- disable cmp
map("n","<A-c>" , "require('cmp').setup.buffer { enabled = false }<CR>")

-- windows
map("n", "<C-h>", "<C-w>h") -- move between windows
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "q:", "<Esc>")
-- terminal window
map("n", "<C-t>", "<Esc>:split<cr>:resize 10<cr>:set nonumber<cr>:terminal<cr>i")

map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- buffers
map("n", "<C-c>", cmd.bdelete)
map("n", "<S-l>", cmd.bnext)
map("n", "<S-h>", cmd.bprevious)

-- move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")


--# visual mode #--

-- for indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")

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


--# plugins #--

-- plugin manager
map("n", "<leader>P", cmd.Lazy)
-- lsp manager
map("n", "<leader>lm", cmd.Mason)

-- map("n", "<leader>Gs", cmd.Git)
-- map("n", "<leader>u", cmd.UndotreeToggle)
