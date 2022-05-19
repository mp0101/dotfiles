local env = require("conf.env")
local cwd = vim.fn.getcwd()
local f = string.format
local autocmd = vim.api.nvim_create_autocmd

local set = vim.opt

if env.tempdir then
  -- Temp files directory
  set.backupdir = env.tempdir
  set.directory = env.tempdir
else
  -- Don't use temp files
  set.swapfile = false
  set.backup = false
end

-- Ignore the case when the search pattern is all lowercase
set.smartcase = true
set.ignorecase = true

-- Autosave when navigating between buffers
set.autowrite = true

-- Disable line wrapping
set.wrap = false

-- Enable Fold
set.foldmethod = "marker"
set.foldmarker = "[[[,]]]"
set.foldenable = true

-- Keep lines below cursor when scrolling
set.scrolloff = 2
set.sidescrolloff = 5

-- Enable highlight search results
set.hlsearch = true

-- Enable incremental search
set.incsearch = true

-- Enable numberline
set.number = true

-- Enable cursorline
set.cursorline = true

-- Enable colorcolumn
set.colorcolumn = "81"

-- Enable syntax highlight
vim.cmd("syntax enable")

-- Always display signcolumn (for diagnostic related stuff)
set.signcolumn = "yes"

-- When opening a window put it right or below the current one
set.splitright = true
set.splitbelow = true

-- Background to dark
set.background = "dark"

-- Enable 256-colors
if vim.fn.has("termguicolors") == 1 then
  set.termguicolors = true
end

-- Theme
local theme = pcall(require, "kanagawa")
if theme then vim.cmd("colorscheme kanagawa") end

-- Preserve state (undo, marks, etc) in non visible buffers
set.hidden = true

-- Tab set to two spaces
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Enable mouse support
set.mouse = "a"

-- Look for a tag file in the git folder
-- I shouldn't have to use `cwd` but here we are
set.tags:prepend(f("%s/.git/tags", cwd))

-- Clipboard using xclip
set.clipboard:append("unnamedplus")

-- Insert mode completion setting
set.completeopt = { "menu", "menuone", "noselect" }

-- Set grep default grep command with ripgrep
set.grepprg = "rg --vimgrep --follow"
set.errorformat:append("%f:%l:%c%p%m")

if env.preserve_beam_cursor then
  autocmd("VimLeave", { command = "set guicursor=a:ver25" })
end
