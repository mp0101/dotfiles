local server = {}

server.sumneko_lua = {
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_size = "2",
          quote_style = "double",
        },
      },
      telemetry = { enable = false }
    }
  }
}

return server
