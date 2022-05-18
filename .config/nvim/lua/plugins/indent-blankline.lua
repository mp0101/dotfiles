vim.opt.list = true
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:↴")

local iblankline = require('indent_blankline')

iblankline.setup {
    show_end_of_line = true,
    show_current_context = true,
}
