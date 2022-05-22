local fns = require("conf.functions")
local setup = require("plugins.misc")
local plug = require("plug")

local use = function(mod) return function() require(mod) end end

-- [[[ Plugins Manager
plug.init({
  { "k-takata/minpac", type = "opt" },

  -- [[[ Fuzzy finder

  { "tami5/sqlite.lua" },
  { "nvim-telescope/telescope-smart-history.nvim" },
  { "nvim-telescope/telescope-frecency.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzf-writer.nvim" },
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

  -- ]]]
  -- [[[ Distraction free mode

  { "folke/zen-mode.nvim", config = use("plugins.zen-mode") },

  -- ]]]
  -- [[[ File explorer

  {
    "tamago324/lir.nvim",
    type = "start",
    config = use("plugins.lir")
  },

  -- ]]]
  -- [[[ Editor config

  { "editorconfig/editorconfig-vim" },
  -- ]]]
  -- [[[ Language support
  { "othree/html5.vim", type = "start" },
  { "pangloss/vim-javascript", type = "start" },
  { "lumiliet/vim-twig", type = "start" },
  {
    "nvim-treesitter/nvim-treesitter",
    frozen = true,
    run = function() pcall(vim.cmd, "TSUpdate") end,
    config = use("plugins.treesitter")
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    frozen = true,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "p00f/nvim-ts-rainbow" },

  -- ]]]
  -- [[[ Autocompletion

  { "hrsh7th/nvim-cmp", config = use("plugins.nvim-cmp") },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "saadparwaiz1/cmp_luasnip" },

  -- ]]]
  -- [[[ Snippets

  { "VonHeikemen/the-good-snippets", type = "start" },
  { "mattn/emmet-vim", type = "opt" },
  { "L3MON4D3/LuaSnip", config = use("plugins.luasnip") },
  { "windwp/nvim-autopairs", config = setup.autopairs },
  { "numToStr/Comment.nvim", type = "start", config = setup.comment },

  -- ]]]
  -- [[[ LSP support

  { "neovim/nvim-lspconfig", type = "opt" },
  { "williamboman/nvim-lsp-installer", type = "opt" },
  { "VonHeikemen/lsp-zero.nvim", type = "opt" },
  { "j-hui/fidget.nvim", type = "opt" },

  -- ]]]
  -- [[[ Enhance quickfix list

  { "romainl/vim-qf" },
  { "stefandtw/quickfix-reflector.vim" },

  -- ]]]
  -- [[[ Startup screen

  {
    "goolord/alpha-nvim",
    type = "start",
    config = use("plugins.alpha")
  },

  -- ]]]
  -- [[[ UI components

  { "rebelot/kanagawa.nvim", type = "start" },
  { "kyazdani42/nvim-web-devicons", type = "start" },
  { "yamatsum/nvim-nonicons", type = "start", config = setup.nonicons },
  { "VonHeikemen/searchbox.nvim", config = setup.searchbox },
  { "rcarriga/nvim-notify", config = setup.nvim_notify },
  {
    "VonHeikemen/fine-cmdline.nvim",
    config = setup.fine_cmdline
  },
  {
    "MunifTanjim/nui.nvim",
    type = "start",
    config = use("plugins.vim-ui")
  },

  -- ]]]
  -- [[[ Ultilities

  { "petertriho/nvim-scrollbar", config = use("plugins.scrollbar") },
  { "lukas-reineke/indent-blankline.nvim", config = use("plugins.indentline") },
  { "antoinemadec/FixCursorHold.nvim", type = "start" },
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

-- ]]]

-- ]]]
-- [[[ Local Plugin

-- Session manager
require("plugins.session")

-- ]]]
