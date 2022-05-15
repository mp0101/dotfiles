if not pcall(require, "telescope") then
  return
end

local map = vim.keymap.set
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})

telescope.load_extension("fzf")

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

-- Keybinds for editing init files
map("n", "<Leader>fd", search_dotfiles, { silent = true })
-- telescope fuzzy find stuff
map("n", "<Leader>ff", builtin.find_files, { silent = true })
map("n", "<Leader>fw", search_workspace, { silent = true })
map("n", "<Leader>fg", builtin.live_grep, { silent = true })
map("n", "<Leader>fh", builtin.help_tags, { silent = true })
