if not pcall(require,"bufferline") then
  return
end

local map = vim.keymap.set
local bufferline = require("bufferline")
bufferline.setup({})

map ("n", "<C-Right>", ":BufferLineCycleNext<CR>")
map ("n", "<C-Left>", ":BufferLineCyclePrev<CR>")
