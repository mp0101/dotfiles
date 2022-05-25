if not pcall (require,"indent_blankline") then
  return
end

local blankline = require ("indent_blankline")

blankline.setup {
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'dashboard',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'NvimTree',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
}
