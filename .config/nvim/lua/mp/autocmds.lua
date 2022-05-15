local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "460" })
  end
})

augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = "CursorLineControl",
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Save/restore code folds
local saveFolds = augroup("saveFolds", {})
autocmd("BufWritePost", {
  command = "silent mkview",
  group = saveFolds,
})
autocmd("BufReadPost", {
  command = "silent! loadview",
  group = saveFolds,
})
-- Format code on save for certain file types
local formatCode = augroup("formatCode", {})
autocmd("BufWritePre", {
  pattern = {
    "*.cpp",
    "*.js",
    "*.lua",
    "*.md",
    "*.ts",
  },
  callback = vim.lsp.buf.formatting_sync,
  group = formatCode,
})
