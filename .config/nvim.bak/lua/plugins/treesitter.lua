if not pcall(require,"nvim-treesitter") then
  return
end

local TSConfigs = require("nvim-treesitter.configs")

TSConfigs.setup({
  ensure_installed = {
    "bash", "c", "cpp",
    "css", "scss", "html", "javascript", "typescript", "tsx", "json", "markdown",
    "perl", "php", "http",
    "go", "gomod", "gowork", "ruby", "rust",
    "lua", "vim", "devicetree",
    "todotxt", "latex", "yaml",
  },
  sync_install = false,
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex" },
    },
    indent = {
      enable = true,
    },
  rainbow = {
    enable = true,
  },
    playground = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<Leader>;"] = "@swappable",
            },
            swap_previous = {
                ["<Leader>,"] = "@swappable",
            },
        },
    },
})

