if not pcall(require,"nvim-treesitter") then
  return
end

local treesitter = require ("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "lua", "vim",
  },
  highlight = { enable = true },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})
