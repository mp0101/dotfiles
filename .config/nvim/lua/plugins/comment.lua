if not pcall(require, "Comment") then
  return
end

local comment = require("Comment")
local map = vim.keymap.set

comment.setup({
  pre_hook = function(ctx)
    local U = require("Comment.utils")

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
})

-- Universal comments with <C-/> (written as <C-_> to work in terminal)
map("n", "<C-/>", require("Comment.api").toggle_current_linewise)
map("x", "<C-/>", "<Cmd>norm gbgv<CR>")
map("n", "<C-_>", require("Comment.api").toggle_current_linewise)
map("x", "<C-_>", "<Cmd>norm gbgv<CR>")

