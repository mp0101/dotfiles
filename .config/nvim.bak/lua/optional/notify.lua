if not pcall(require, "notify") then
  return
end

local notify = require("notify")
local log = require("plenary.log").new({
  plugin = "notify",
  level = "debug",
  use_console = false,
})

vim.notify = function(msg, level, opts)
  log.info(msg, level, opts)
  notify(msg, level, opts)
end

notify.setup({
  fps = 30,
  stages = "fade",
  render = "minimal",
  timeout = 1000,
})
