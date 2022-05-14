local set = vim.opt
local theme = pcall(require,'kanagawa')
if theme then vim.cmd('colorscheme kanagawa') end

set.background = 'dark'
set.termguicolors = true
set.cursorline = true
set.laststatus = 3

set.mouse = 'a'
set.number = true
set.relativenumber = false

set.colorcolumn = '81'
set.signcolumn = 'yes:1'

set.swapfile = false
set.backup = false

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true

set.clipboard = 'unnamedplus'
