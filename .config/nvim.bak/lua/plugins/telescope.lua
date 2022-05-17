if not pcall(require, "telescope") then
  return
end

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    prompt_prefix = "❯ ",
    entry_prefix = "  ",
    selection_caret = "❯ ",
    multi_icon = "<>",
    winblend = 0,
    sorting_strategy = "ascending",
    selection_strategy = "reset",
    scroll_strategy = "cycle",
    color_devicons = true,
    layour_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 25,
      -- mirror = true,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },
    extension = {
      fzf = {
        use_highlighter = false,
        minimum_grep_characters = 6,
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {

      },
    },
  },
})


search_dotfiles = function()
  builtin.find_files({
    prompt_title = "Configuration files",
    cwd = vim.fn["stdpath"]("config"),
    file_ignore_patterns = { ".png", ".mp3", ".mp4" },
  })
end

search_workspace = function()
  builtin.find_files({
    prompt_title = "Workspace files",
    cwd = vim.env.WORKSPACE,
    file_ignore_patterns = {
      -- TeX temporary files
      "%.aux",
      "%.fdb_latexmk",
      "%.fls",
      "%.log",
      "%.pdf_tex",
      "%.synctex.gz",
      "%.ttf",
      "%.xdv",
      -- C++ temporary files
      "%.o",
      "%.out",
      -- Git related files and directories
      "description",
      "packed%-refs",
      "HEAD",
      "hooks/",
      "objects/",
      "refs/",
      "info/",
      "logs/",
      "worktrees/",
    },
  })
end

telescope.load_extension("fzf")

-- Telescope
map("n", "<Leader>?", ":Telescope keymaps<CR>")
map("n", "<Leader>ft", ":Telescope treesitter<CR>")
-- Keybinds for editing init files
map("n", "<Leader>fd", search_dotfiles, { silent = true })
-- telescope fuzzy find stuff
map("n", "<Leader>ff", builtin.find_files, { silent = true })
map("n", "<Leader>fw", search_workspace, { silent = true })
map("n", "<Leader>fg", builtin.live_grep, { silent = true })
map("n", "<Leader>fh", builtin.help_tags, { silent = true })

