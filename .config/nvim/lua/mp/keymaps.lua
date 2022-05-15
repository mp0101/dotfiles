if not pcall(require, "telescope") then
  return
end

-- Keymaps Configurations
local fns = require("mp.functions")
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

-- Keybinds for editing init files
map("n", "<Leader>fd", require("plugins.telescope").search_dotfiles, { silent = true })
-- telescope fuzzy find stuff
map("n", "<Leader>ff", require("telescope.builtin").find_files, { silent = true })
map("n", "<Leader>fw", require("plugins.telescope").search_workspace, { silent = true })
map("n", "<Leader>fg", require("telescope.builtin").live_grep, { silent = true })
map("n", "<Leader>fh", require("telescope.builtin").help_tags, { silent = true })
-- Open file manager
map("n", "<leader>dd", fns.file_explorer)
map("n", "<leader>da", function() fns.file_explorer(vim.fn.getcwd()) end)
-- Universal comments with <C-/> (written as <C-_> to work in terminal)
map("n", "<C-/>", require("Comment.api").toggle_current_linewise)
map("x", "<C-/>", "<Cmd>norm gbgv<CR>")
map("n", "<C-_>", require("Comment.api").toggle_current_linewise)
map("x", "<C-_>", "<Cmd>norm gbgv<CR>")
