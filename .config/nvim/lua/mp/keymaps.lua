local map = vim.keymap.set

vim.g.mapleader = " "

map("i", "JK", "<Esc>")
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
map("i", "KJ", "<Esc>")

map({"n", "x", "i", "v"}, "<Up>", "<Nop>")
map({"n", "x", "i", "v"}, "<Down>", "<Nop>")
map({"n", "x", "i", "v"}, "<Right>", "<Nop>")
map({"n", "x", "i", "v"}, "<Left>", "<Nop>")

map("n", "<M-q>", ":quit<CR>")

map("i", "<M-w>", "<Esc>:write<CR>")
map("n", "<M-w>", ":write<CR>")

map("n", "<M-r>", ":so %<CR>")
