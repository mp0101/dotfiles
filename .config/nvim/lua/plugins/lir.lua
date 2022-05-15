if not pcall(require, "lir") then
  return
end

local fm = require("lir")
local actions = require("lir.actions")
local gfm = require("lir.git_status")

gfm.setup({
  show_ignored = true
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
