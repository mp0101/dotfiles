if not pcall(require,'nvim-treesitter') then
  return
end

local TSConfigs = require('nvim-treesitter.configs')

TSConfigs.setup({
  indent = { enable = true },
  highlight = { enable = true },
})
