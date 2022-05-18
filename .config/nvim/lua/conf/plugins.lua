local fns = require("conf.functions")
local setup = require("plugins.misc")
local plug = require("plug")

local use = function(mod) return function() require(mod) end end

-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

plug.init({
  -- Plugin manager
  { "k-takata/minpac", type = "opt" },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    config = use("plugins.telescope")
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    type = "start",
    depth = 2,
    run = function()
      if vim.fn.executable("make") == 0 then return end

      vim.fn.jobstart({ "make" }, {
        cwd = vim.fn.getcwd() .. "/deps/fzy-lua-native",
        on_stdout = fns.job_output,
      })
    end
  },

  -- ColorScheme
  { "Yagua/nebulous.nvim", type = "start" },

  -- Statusline
  {
    "feline-nvim/feline.nvim",
    type = "start",
    config = use("plugins.feline")
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    type = "start",
    config = use("plugins.bufferline")
  },

  -- Indent-Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = use("plugins.indent-blankline")
  },

  -- Distraction free mode
  { "folke/zen-mode.nvim", config = use("plugins.zen-mode") },

  -- File explorer
  {
    "tamago324/lir.nvim",
    type = "start",
    config = use("plugins.lir")
  },
  { "tamago324/lir-git-status.nvim" },

  -- Icons
  { "kyazdani42/nvim-web-devicons", type = "start" },
  { "yamatsum/nvim-nonicons", type = start },

  -- Better clipboard support
  { "christoomey/vim-system-copy" },

  -- Editor config
  { "editorconfig/editorconfig-vim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp", config = use("plugins.nvim-cmp") },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "ray-x/cmp-treesitter" },
  { "saadparwaiz1/cmp_luasnip" },


  -- Snippets
  { "VonHeikemen/the-good-snippets", type = "start" },
  { "mattn/emmet-vim", type = "opt" },
  { "L3MON4D3/LuaSnip", config = use("plugins.luasnip") },
  { "windwp/nvim-autopairs", config = setup.autopairs },
  -- { "b3nj5m1n/kommentary", config = setup.kommentary },
  { "numToStr/Comment.nvim", config = use("plugins.comment") },

  -- Language support
  { "othree/html5.vim", type = "start" },
  { "pangloss/vim-javascript", type = "start" },
  { "lumiliet/vim-twig", type = "start" },
  {
    "nvim-treesitter/nvim-treesitter",
    frozen = true,
    run = function() pcall(vim.cmd, "TSUpdate") end,
    config = use("plugins.treesitter")
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "theHamsta/nvim-treesitter-pairs" },
  { "p00f/nvim-ts-rainbow" },

  -- LSP support
  { "neovim/nvim-lspconfig", type = "opt" },
  { "onsails/lspkind.nvim", type = "start" },
  { "williamboman/nvim-lsp-installer", type = "opt" },
  { "VonHeikemen/lsp-zero.nvim", type = "opt" },
  { "j-hui/fidget.nvim", type = "opt" },
  -- { "folke/trouble.nvim", config = use("plugins.trouble") },

  -- Enhance quickfix list
  { "romainl/vim-qf" },
  { "stefandtw/quickfix-reflector.vim" },

  -- Startup screen
  {
    "goolord/alpha-nvim",
    type = "start",
    config = use("plugins.alpha")
  },

  -- UI components
  {
    "MunifTanjim/nui.nvim",
    type = "start",
    config = use("plugins.vim-ui")
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    config = use("plugins.fineline")
  },
  { "VonHeikemen/searchbox.nvim", config = setup.searchbox },
  { "rcarriga/nvim-notify", config = setup.nvim_notify },

  --  Utilities
  { "sunjon/shade.nvim", config = use("plugins.shade") },
  { "karb94/neoscroll.nvim", config = use("plugins.neoscroll") },
  { "petertriho/nvim-scrollbar", config = use("plugins.scrollbar") },
  { "yamatsum/nvim-cursorline", config = use("plugins.cursorline") },
  { "AckslD/nvim-trevJ.lua", type = "start" },
  { "moll/vim-bbye" },
  { "wellle/targets.vim" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-abolish" },
  { "nvim-treesitter/playground", type = "opt" },
  { "nvim-lua/plenary.nvim", type = "start" },
  { "nvim-lua/popup.nvim", type = "start" },
  { "NMAC427/guess-indent.nvim", config = setup.guess_indent },
  { "ggandor/lightspeed.nvim", config = setup.lightspeed },
  {
    "VonHeikemen/project-settings.nvim",
    type = "start",
    config = use("plugins.project-settings")
  }
})

-- ========================================================================== --
-- ==                            LOCAL PLUGINS                             == --
-- ========================================================================== --

-- Session manager
require("plugins.session")
