local set = vim.opt

set.mouse = "n"
set.number = true
set.relativenumber = false
set.cursorline = true
set.signcolumn = "yes:1"
set.colorcolumn = "81"

set.background = "dark"
set.termguicolors = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

set.expandtab = true
set.smarttab = true

set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.ignorecase = true

set.foldmethod = "marker"
set.foldmarker = "[[[,]]]"
set.foldenable = true
set.modelines = 1

set.inccommand = "split"
set.shada = { "!", "'1000", "<50", "s10", "h" }
set.updatetime = 460
set.hidden = true

set.showmode = false
set.showcmd = true
set.cmdheight = 1

set.backup = false
set.swapfile = false

set.clipboard:append("unnamedplus")
