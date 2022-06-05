if not pcall (require, "lspconfig", "fidget") then
  return
end

local fidget = require("fidget")

fidget.setup({
  text = {
    spinner = "arc"
  }
})

local root_dir = function()
  return vim.fn.getcwd()
end

local lspconfig = require ("lspconfig")
local servers = { "sumneko_lua", "vimls" }

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = on_attach,
    root_dir = root_dir,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
