if not pcall(require, "nvim-treesitter") then
  return
end

local TSConfigs = require("nvim-treesitter.configs")

TSConfigs.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  highlight = { enable = true },
  playground = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<Leader>;"] = "@swappable",
      },
      swap_previous = {
        ["<Leader>,"] = "@swappable",
      },
    },
  },
})
