local command = vim.api.nvim_create_user_command

local telescope = require('telescope')
local actions = require('telescope.actions')

command('TGrep', function(input)
  require('telescope.builtin').grep_string({search = input.args})
end, {nargs = 1})

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
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
      }
    },

    -- Default layout options
    prompt_prefix = " Find : ",
    selection_caret = '❯ ',
    entry_prefix = "  ",
    multi_icon = "+",
    winblend = 0,
    color_devicons = true,
    select_strategy = 'reset',
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    scroll_strategy = 'cycle',
    layout_config = {
      preview_cutoff = 25,
      mirror = false,
      prompt_position = 'top'
    },
  },
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
    media_files = defaults(),

    commands = defaults(),
    help_tags = defaults(),
  },
  history = {
    path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
    limit = 100,
  },
  extension = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    },
    media_files = {
      filetypes = {
        -- Images Type
        "pdf", "jpg", "png", "jpeg",
        -- Video Type
        "mp4", "webp",
      },
      find_cmd = "rg",
    },
  }
})

telescope.load_extension('media_files')
telescope.load_extension('smart_history')
telescope.load_extension('frecency')
telescope.load_extension('fzy_native')
telescope.load_extension('fzf_writer')

