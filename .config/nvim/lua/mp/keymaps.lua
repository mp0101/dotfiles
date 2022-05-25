local fns = require ("mp.functions")
local map = vim.keymap.set

vim.g.mapleader = " "

map("i", "JK", "<Esc>")
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
map("i", "KJ", "<Esc>")

map("n", "<M-q>", ":quit<CR>")
map("n", "<M-w>", ":write<CR>")
map("n", "<M-r>", ":so %<CR>")

-- Open file manager
map('n', '<leader>dd', fns.file_explorer)
map('n', '<leader>da', function() fns.file_explorer(vim.fn.getcwd()) end)
