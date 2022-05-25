if not pcall (require,"lir") then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local filemanager = require ("lir")
local actions = require ("lir.actions")

filemanager.setup {

  show_hidden_files = false,
  hide_cursor = false,
  devicons_enable = true,

  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

  },
  float = {
    winblend = 0,
    win_opts = function()
      return {
        border = "rounded"
      }
    end
  }
}
