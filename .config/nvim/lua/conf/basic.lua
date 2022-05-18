local cwd = vim.fn.getcwd()
local f = string.format
local autocmd = vim.api.nvim_create_autocmd

local set = vim.opt

-- Disable swap & backup files
set.swapfile = false
set.backup = false

-- Ignore the case when the search pattern is all lowercase
set.smartcase = true
set.ignorecase = true

-- Autosave when navigating between buffers
set.autowrite = true

-- Disable line wrapping
set.wrap = false

-- Keep lines below cursor when scrolling
set.scrolloff = 2
set.sidescrolloff = 5

-- Highlight search results
set.hlsearch = true

-- Enable incremental search
set.incsearch = true

-- Enable cursorline
set.cursorline = true

-- Enable syntax highlight
vim.cmd("syntax enable")

set.cmdheight = 1
set.showmode = false
set.showcmd = true

-- Show numberline
set.number = true

-- Always display signcolumn (for diagnostic related stuff)
set.signcolumn = "yes:1"
set.colorcolumn = "81"

-- When opening a window put it right or below the current one
set.splitright = true
set.splitbelow = true

if vim.fn.has("termguicolors") == 1 then
  set.termguicolors = true
end

-- Preserve state (undo, marks, etc) in non visible buffers
set.hidden = true

-- Tab set to two spaces
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Enable mouse support
set.mouse = "a"

set.clipboard:append("unnamedplus")

-- Look for a tag file in the git folder
-- I shouldn't have to use `cwd` but here we are
set.tags:prepend(f("%s/.git/tags", cwd))

set.lazyredraw = true
set.updatetime = 360
-- Insert mode completion setting
set.completeopt = { "menu", "menuone", "noselect" }
set.pumheight = 7
set.pumblend = 0

set.shortmess:append("c")
-- Apply theme
local theme = pcall(require, "conf.colors")
if theme then vim.cmd("colorscheme nebulous") end

-- Set grep default grep command with ripgrep
set.grepprg = "rg --vimgrep --follow"
set.errorformat:append("%f:%l:%c%p%m")
