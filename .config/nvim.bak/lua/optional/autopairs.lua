if not pcall(require,"nvim-autopairs") then
  return
end

local autopairs = require("nvim-autopairs")

autopairs.setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
})
