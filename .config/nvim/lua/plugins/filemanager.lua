if not pcall(require, "lir") then
  return
end

local fm = require("lir")
local actions = require("lir.actions")
local gfm = require("lir.git_status")

local fns = require('mp.functions')
local map = vim.keymap.set

gfm.setup({
  show_ignored = false
})

fm.setup({
  show_hidden_files = false,
  devicons_enable = true,
  hide_cursor = true,
  mappings = {
    ["l"] = actions.edit,
    ["h"] = actions.up,
    ["q"] = actions.quit,
    ["K"] = actions.mkdir,
    ["N"] = actions.newfile,
    ["R"] = actions.rename,
    ["."] = actions.toggle_show_hidden,
    ["D"] = actions.delete,
  },
  float = {
    winblend = 0,
    win_opts = function()
      return {
        border = "rounded"
      }
    end
  }
})

-- Open file manager
map("n", "<leader>dd", fns.file_explorer)
map("n", "<leader>da", function() fns.file_explorer(vim.fn.getcwd()) end)
