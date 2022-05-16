if not pcall(require,"notify") then
  return
end

local notify = require("notify")

vim.notify = notify
notify.setup({
  stage = "slide",
  level = "DEBUG",
  background_colour = vim.g.terminal_color_background,
  minimum_width = 15
})
