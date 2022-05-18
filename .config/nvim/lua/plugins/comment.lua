local comment = require("Comment")
local utils = require("Comment.utils")
local api = require("Comment.api")
local tsc = require("ts_context_commentstring.utils")
local tsi = require("ts_context_commentstring.internal")
local bind = vim.keymap.set

comment.setup({
  pre_hook = function(ctx)
    local U = utils

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = tsc.get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = tsc.get_visual_start_location()
    end

    return tsi.calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
})

-- Universal comments with <C-/> (written as <C-_> to work in terminal)
bind("n", "<C-/>", api.toggle_current_linewise)
bind("x", "<C-/>", "<Cmd>norm gbgv<CR>")
bind("n", "<C-_>", api.toggle_current_linewise)
bind("x", "<C-_>", "<Cmd>norm gbgv<CR>")
