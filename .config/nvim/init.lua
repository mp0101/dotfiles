require "mp.settings"
require "mp.keymaps"

if require "plug"() then
	return
end

require 'plugins.install'
require 'plugins.telescope'
require 'plugins.treesitter'
