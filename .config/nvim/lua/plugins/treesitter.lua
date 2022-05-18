local treesitter = require("nvim-treesitter.configs")
local highlight = require("nvim-treesitter.highlight")
local list = require("nvim-treesitter.parsers").get_parser_configs()

list.sql = {
  install_info = {
    url = "https://github.com/DerekStride/tree-sitter-sql",
    files = { "src/parser.c" },
    branch = "main",
  },
}

local custom_captures = {
  ["function.call"] = "LuaFunctionCall",
  ["function.bracket"] = "Type",
  ["namespace.type"] = "TSNamespaceType",
}

highlight.set_custom_captures(custom_captures)

treesitter.setup({
  highlight = {
    enable = true,
    use_languagetree = false,
    custom_captures = custom_captures,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_line = nil,
  },
  pairs = {
    enable = true,
    disable = {},
    highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
    highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
    goto_right_end = false, -- whether to go to the end of the right partner or the beginning
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
    keymaps = {
      goto_partner = "<Leader>%",
      delete_balanced = "X",
    },
    delete_balanced = {
      only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
      fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
      longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
      -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
    }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = false,
      keymaps = {
        -- mapping to rename reference under cursor
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = false,
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ia"] = "@parameter.inner",
      }
    },
    swap = {
      enable = true,
      swap_previous = {
        ["[a"] = "@parameter.inner",
      },
      swap_next = {
        ["]a"] = "@parameter.inner",
      },
    }
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "php",
    "lua",
    "python",
    "markdown",
    "css",
    "json",
    "vim"
  },
})
