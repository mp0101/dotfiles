if not pcall(require,"nvim-treesitter") then
  return
end

local treesitter = require ("nvim-treesitter")

treesitter.setup({
  ensure_installed = "",
  highlight = { enable = true },
  indent = { enable = true }
})
