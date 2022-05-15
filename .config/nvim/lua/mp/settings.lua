local set = vim.opt
local theme = pcall(require, "kanagawa")
if theme then vim.cmd("colorscheme kanagawa") end

set.background = "dark"
set.termguicolors = true
set.cursorline = true
set.laststatus = 3
set.showmatch = true

set.mouse = "a"
set.number = true
set.relativenumber = false

set.colorcolumn = "81"
set.signcolumn = "yes:1"

set.swapfile = false
set.backup = false

set.showmode = false
set.showcmd = true
set.cmdheight = 1
set.equalalways = true
set.hidden = true

set.splitbelow = true
set.splitright = true
set.updatetime = 460

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true

set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.ignorecase = true
set.scrolloff = 10

set.clipboard = "unnamedplus"
