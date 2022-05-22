local M = {}

M.autopairs = function()
  local npairs = require('nvim-autopairs')
  npairs.setup({fast_wrap = {}})
end

M.comment = function()
require("Comment").setup({
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

end

M.fine_cmdline = function()
  require('fine-cmdline').setup({
    cmdline = {
      prompt = ' '
    }
  })
end

M.searchbox = function()
  require('searchbox').setup({
    hooks = {
      on_done = function(value)
        if value == nil then return end
        vim.fn.setreg('s', value)
      end
    }
  })
end

M.nvim_notify = function()
  vim.notify = require('notify')
  vim.notify.setup({
    stages = 'slide',
    level = 'DEBUG',
    background_colour = vim.g.terminal_color_background,
    minimum_width = 15
  })
end

M.guess_indent = function()
  require('guess-indent').setup({
    auto_cmd = false,
    verbose = 1
  })
end

M.lightspeed = function()
  require('lightspeed').setup({
    limit_ft_matches = 0,
    jump_to_unique_chars = false,
    exit_after_idle_msecs = {labeled = nil, unlabeled = 600},
    safe_labels = {},
    labels = {
      'w', 'f', 'a',
      'j', 'k', 'l', 'o', 'i', 'q', 'e', 'h', 'g',
      'u', 't',
      'm', 'v', 'c', 'n', '.', 'z',
      '/', 'F', 'L', 'N', 'H', 'G', 'M', 'U', 'T', '?', 'Z',
    },
  })
end

M.nonicons = function()
  local icons = require("nvim-nonicons")
  icons.get("file")
end

return M

