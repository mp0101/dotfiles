-- Basic editor options
require("conf.basic")

-- User defined commands
require("conf.commands")
require("conf.autocmds")

-- Install plugins if necessary
if require("plugins.install") then return end

-- Plugin management and config
require("conf.plugins")

-- Keybindings
require("conf.keymaps")
