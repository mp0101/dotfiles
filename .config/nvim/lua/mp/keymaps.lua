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
map ( '', '<Up>', '<Nop>', { silent = true } )
map ( '', '<Down>', '<Nop>', { silent = true } )
map ( '', '<Right>', '<Nop>', { silent = true } )
map ( '', '<Left>', '<Nop>', { silent = true } )
-- switch fast to esc
map ( {'i', 'v'}, "JK", '<Esc>', { silent = true } )
map ( {'i', 'v'}, "KJ", '<Esc>', { silent = true } )
map ( {'i', 'v'}, "jk", '<Esc>', { silent = true } )
map ( {'i', 'v'}, "kj", '<Esc>', { silent = true } )
