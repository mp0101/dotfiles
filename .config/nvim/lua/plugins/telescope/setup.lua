if not pcall (require,"telescope") then
  return
end

local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    sorting_strategy = "descending",
    prompt_position = "top",
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-k>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_previous,
      },
    },
  },
}
