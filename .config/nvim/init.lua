require "mp.settings"
require "mp.keymaps"
require "mp.autocmds"

if require "plug" () then
  return
end

require "plugins.install"
require "plugins.lualine"
require "plugins.indent-blankline"
require "plugins.lir"
require "plugins.telescope"
require "plugins.comment"
