-- Keymaps Configurations
local map = vim.keymap.set
local g = vim.g

-- set Space to Leader
map ( 'n', '<Space>', '<Nop>', { silent = true } )
g.mapleader = ' '
-- safe write
map ( 'n', '<M-w>', ':write<CR>', { silent = true } )
-- safe quit
map ( 'n', '<M-q>', ':quit<CR>', { silent = true } )
-- disable arrowkeys in all modes
map ( {'n','i','x','v'}, '<Up>', '<Nop>', { silent = true } )
map ( {'n','i','x','v'}, '<Down>', '<Nop>', { silent = true } )
map ( {'n','i','x','v'}, '<Right>', '<Nop>', { silent = true } )
map ( {'n','i','x','v'}, '<Left>', '<Nop>', { silent = true } )
-- switch fast to esc
map ( 'i', "JK", '<Esc>', { silent = true } )
map ( 'i', "KJ", '<Esc>', { silent = true } )
map ( 'i', "jk", '<Esc>', { silent = true } )
map ( 'i', "kj", '<Esc>', { silent = true } )
-- Keybinds for editing init files
map("n", "<Leader>fd", require("plugins.telescope").search_dotfiles, { silent = true })
-- telescope fuzzy find stuff
map("n", "<Leader>ff", require("telescope.builtin").find_files, { silent = true })
map("n", "<Leader>fw", require("plugins.telescope").search_workspace, { silent = true })
map("n", "<Leader>fg", require("telescope.builtin").live_grep, { silent = true })
map("n", "<Leader>fh", require("telescope.builtin").help_tags, { silent = true })
