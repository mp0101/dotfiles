local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '460' })
  end
})

local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local setCursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
setCursorline("WinLeave", false)
setCursorline("WinEnter", true)
setCursorline("FileType", false, "TelescopePrompt")
