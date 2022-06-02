local map_tele = vim.keymap.set

map_tele("n", "<Leader>?", ":Telescope keymaps<CR>")
map_tele("n", "<Leader>ff", ":Telescope find_files<CR>")
map_tele("n", "<Leader>fg", ":Telescope live_grep<CR>")
map_tele("n", "<Leader>fs", ":Telescope treesitter<CR>")
map_tele("n", "<Leader>fh", ":Telescope oldfiles<CR>")

map_tele("n", "<Leader>bb", ":Telescope buffers<CR>")
map_tele("n", "<Leader>B", ":Telescope buffers only_cwd=true<CR>")

