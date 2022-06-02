local telescope = require("telescope")
local actions = require("telescope.actions")


local defaults = function(title)
  return {
    prompt_title = title,
    results_title = false
  }
end

local dropdown = function(title, previewer)
  return {
    prompt_title = title,
    previewer = previewer or false,
    theme = 'dropdown'
  }
end

telescope.setup({
    pickers = {
    buffers = dropdown(),
    find_files = dropdown(),
    oldfiles = dropdown('History'),
    keymaps = dropdown(),
    command_history = dropdown(),
    colorscheme = dropdown(),

    grep_string = defaults('Search'),
    treesitter = defaults('Buffer Symbols'),
    current_buffer_fuzzy_find = defaults('Lines'),
    live_grep = defaults('Grep'),

    commands = defaults(),
    help_tags = defaults(),
  },
})
