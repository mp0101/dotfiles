local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<Leader>?", ":Telescope keymaps<CR>")
map("n", "<Leader>ft", ":Telescope treesitter<CR>")
-- Keybinds for editing init files
map("n", "<Leader>fd", search_dotfiles, { silent = true })
-- telescope fuzzy find stuff
map("n", "<Leader>ff", builtin.find_files, { silent = true })
map("n", "<Leader>fw", search_workspace, { silent = true })
map("n", "<Leader>fg", builtin.live_grep, { silent = true })
map("n", "<Leader>fh", builtin.help_tags, { silent = true })
