if not pcall(require,"nvim-autopairs") then
  return
end

local autopairs = require("nvim-autopairs")

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
