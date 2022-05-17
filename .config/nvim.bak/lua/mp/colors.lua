local theme = pcall(require, "nebulous")
if theme then
  require("nebulous").setup({
    variant = "night",
  })
end

local M = {}

M.kanagawa = {
  bg = '#16161D',
  fg = '#C8C093',
  pink = '#D27E99',
  green = '#98BB6C',
  cyan = '#A3D4D5',
  yellow = '#E6C384',
  orange = '#FFA066',
  red = '#FF5D62',
}

return M
