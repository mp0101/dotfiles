_ = vim.cmd [[packadd packer.nvim]]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local packer = require "packer"
local util = require "packer.util"

local packerUserConfig = augroup("packerUserConfig", {})
autocmd("BufWritePost", {
  pattern = {
    "packer.lua",
  },
  command = "source <afile> | PackerCompile",
  group = packerUserConfig,
})

packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = { { "nvim-treesitter/nvim-treesitter-refactor" },
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/playground",
        "JoosepAlviste/nvim-ts-context-commentstring"
      } })

    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } }
    })
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("uga-rosa/cmp-dictionary")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")
    use("j-hui/fidget.nvim")

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = "nvim-lua/plenary.nvim",
    })

    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    })

    use("nvim-telescope/telescope-file-browser.nvim")

    use({
      "tamago324/lir.nvim",
      requires = { { "tamago324/lir-git-status.nvim" },
        "kyazdani42/nvim-web-devicons" }
    })
    use({
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end
    })
    use({
      "akinsho/bufferline.nvim",
      config = function()
        require("bufferline").setup()
      end
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end
    })

    use("numToStr/Comment.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("feline-nvim/feline.nvim")

    use('navarasu/onedark.nvim')
    use('tanvirtin/monokai.nvim')

    use({
      'rose-pine/neovim',
      as = 'rose-pine'
    })

    use({
      "AckslD/nvim-trevJ.lua",
      config = function()
        require("trevj").setup()
      end
    })

    use("tpope/vim-surround")
    use("lervag/vimtex")
    use("ThePrimeagen/vim-be-good")
    use("andweeb/presence.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("tpope/vim-fugitive")
    use("iamcco/markdown-preview.nvim")

  end,
  config = {
    display = {
      open_fn = function()
        return util.float({ border = "rounded" })
      end
    }
  } })
