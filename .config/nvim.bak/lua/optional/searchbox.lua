if not pcall(require,"searchbox")then
  return
end

local map = vim.keymap.set

local searchbox = require("searchbox")
searchbox.setup({
  hooks = {
    on_done = function(value)
    if value == nil then return end
    vim.fn.setreg("s", value)
    end
  }
})

-- Nice buffer local search
map('n', '<Leader>s', ':SearchBoxIncSearch<CR>')
map('x', '<Leader>s', ':SearchBoxIncSearch visual_mode=true<CR>')
map('n', '<Leader>S', ":SearchBoxMatchAll title=' Match '<CR>")
map('x', '<Leader>S', ":SearchBoxMatchAll title=' Match ' visual_mode=true<CR>")
map('n', '<Leader>;', '<cmd>SearchBoxClear<CR>')
-- Begin search & replace
map('n', '<Leader>r', ":SearchBoxReplace confirm=menu<CR>")
map('x', '<Leader>r', ":SearchBoxReplace confirm=menu visual_mode=true<CR>")
map('n', '<Leader>R', ":SearchBoxReplace confirm=menu -- <C-r>=expand('<cword>')<CR><CR>")
map('x', '<Leader>R', ":<C-u>GetSelection<CR>:SearchBoxReplace confirm=menu<CR><C-r>/")
