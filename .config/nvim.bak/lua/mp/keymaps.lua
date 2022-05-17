-- Keymaps Configurations
local map = vim.keymap.set
local g = vim.g

-- set Space to Leader
map("n", "<Space>", "<Nop>", { silent = true })
g.mapleader = " "

-- safe write
map("n", "<M-w>", ":write<CR>", { silent = true })
map("i", "<M-w>", "<Esc>:write<CR>", { silent = true })
-- safe quit
map("n", "<M-q>", ":quit<CR>", { silent = true })
map("i", "<M-q>", "<Esc>:quit<CR>", { silent = true })
-- disable arrowkeys in all modes
map({ "n", "i", "x", "v" }, "<Up>", "<Nop>", { silent = true })
map({ "n", "i", "x", "v" }, "<Down>", "<Nop>", { silent = true })
map({ "n", "i", "x", "v" }, "<Right>", "<Nop>", { silent = true })
map({ "n", "i", "x", "v" }, "<Left>", "<Nop>", { silent = true })
-- switch fast to esc
map("i", "JK", "<Esc>", { silent = true })
map("i", "KJ", "<Esc>", { silent = true })
map("i", "jk", "<Esc>", { silent = true })
map("i", "kj", "<Esc>", { silent = true })
-- Select all
map("n", "<C-a>", "ggVG", { silent = true })
map("i", "<C-a>", "<Esc>ggVG", { silent = true })
-- Deleting words with <C-BS>
map({ "c", "i" }, "", "<C-w>", { remap = true, silent = true })
map({ "c", "i" }, "<C-BS>", "<C-w>", { remap = true, silent = true })
-- Move towards the beginning/end of a line
map({ "n", "x" }, "H", "g^", { silent = true })
map({ "n", "x" }, "L", "g$", { silent = true })
-- Better indent/dedent lines and blocks of text
map("n", ">", ">>", { silent = true })
map("n", "<", "<<", { silent = true })
map("x", ">", ">gv", { silent = true })
map("x", "<", "<gv", { silent = true })
-- Moving lines and preserving indentation
map('n', '<C-j>', ":move .+1<CR>==")
map('n', '<C-k>', ":move .-2<CR>==")
map('v', '<C-j>', ":move '>+1<CR>gv=gv")
map('v', '<C-k>', ":move '<-2<CR>gv=gv")
