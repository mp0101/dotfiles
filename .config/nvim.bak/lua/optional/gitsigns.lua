if not pcall(require,"gitsigns") then
  return
end

local gitsigns = require("gitsigns")
gitsigns.setup({})
