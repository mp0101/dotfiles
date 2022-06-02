if not pcall(require,"telescope") then
  return
end

local telescope = require("telescope")
local actions = require("telescope.actions")
require("plugins.telescope.pickers")
require("plugins.telescope.mappings")

telescope.setup({
  defaults = {
    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },

    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      }
    },

    -- prompt_prefix = "❯ ",
    prompt_prefix = " ",
    selection_caret = "❯ ",
    -- entry_prefix = "  ",
    multi_icon = "+",
    -- path_display = "truncate",
    winblend = 0,

    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
      preview_cutoff = 25,
      mirror = true,
      prompt_position = "top"
    }
  }
})

telescope.load_extension("fzy_native")
