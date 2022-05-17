if not pcall(require,"fine-cmdline") then
  return
end

local map = vim.keymap.set
local cmdline = require("fine-cmdline")

cmdline.setup({
  cmdline = {
    prompt = " "
  }
})

map("n", "<CR>", ":FineCmdline<CR>")
