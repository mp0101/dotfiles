if not pcall(require, "indent-blankline") then
  return
end

local opt = vim.opt

opt.list = true
opt.listchars:append("eol:↲")
opt.listchars:append("trail:•")

require("indent_blankline").setup({
  show_end_of_line = true,
  show_current_context = true,
})
