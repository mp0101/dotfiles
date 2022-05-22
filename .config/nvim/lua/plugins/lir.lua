local lir = require('lir')

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local actions = require('lir.actions')
local marks = require('lir.mark.actions')
local clipboard = require('lir.clipboard.actions')
local devicons = require('nvim-web-devicons')

local on_init = function()
  local bind = vim.keymap.set
  local noremap = {remap = false, silent = true, buffer = true}
  local remap = {remap = true, silent = true, buffer = true}

  local mark = ":<C-u>lua require('lir.mark.actions').toggle_mark('v')<CR>gv<C-c>"

  bind('n', 'v', 'V', noremap)
  bind('x', 'q', '<Esc>', noremap)

  bind('x', '<Tab>', mark, noremap)
  bind('x', 'cc', mark .. 'cc', remap)
  bind('x', 'cx', mark .. 'cx', remap)

  bind('n', '<S-Tab>', 'gv<Tab>', remap)
end

devicons.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7EBAE4",
    name = "LirFolderNode",
  }
})

lir.setup({
  on_init = on_init,
  devicons_enable = true,
  hide_cursor = true,
  mappings = {
    ['l']  = actions.edit,
    ['es'] = actions.split,
    ['ev'] = actions.vsplit,
    ['et'] = actions.tabedit,

    ['h']  = actions.up,
    ['q']  = actions.quit,

    ['.'] = actions.toggle_show_hidden,
    ['i'] = actions.newfile,
    ['o'] = actions.mkdir,
    ['r'] = actions.rename,
    ['d'] = actions.delete,
    ['Y'] = actions.yank_path,

    ['<Tab>'] = marks.toggle_mark,

    ['cc'] = clipboard.copy,
    ['cx'] = clipboard.cut,
    ['cv'] = clipboard.paste,
  },
  float = {
    winblend = 0,
    win_opts = function()
      return {
        border = 'single'
      }
    end
  }
})

