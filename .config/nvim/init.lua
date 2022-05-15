-- User Configurations
require "mp.options"
require "mp.keymaps"
require "mp.autocmds"

-- Download Package
if require "plug" () then
  return
end

-- Loads Packages
require "plugins.packer"
require "plugins.filemanager"
require "plugins.statusline"
require "plugins.blankline"
require "plugins.comment"
require "plugins.telescope"

-- Parser, Lsp, Completions
require "plugins.treesitter"
require "plugins.lspconfig"
require "plugins.completions"
require "plugins.presence"
require "plugins.vimtex"
