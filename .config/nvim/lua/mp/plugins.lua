local plugins = require ("packer")
local utils = require ("packer.util")

plugins.startup ({function(use)
  use ("wbthomason/packer.nvim")
  use ("nvim-lua/plenary.nvim")
  use ("yamatsum/nvim-nonicons")
  use ("kyazdani42/nvim-web-devicons")
  use ({
    "rebelot/kanagawa.nvim",
    config = function()
      require ("mp.colors")
    end
  })
  use ({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require ("plugins.blankline")
    end
  })
  use ({
    "tamago324/lir.nvim",
    config = function()
      require ("plugins.filemanager")
    end
  })
  use ({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require ("plugins.treesitter")
    end
  })
  use ("JoosepAlviste/nvim-ts-context-commentstring")
  use ({
    "nvim-telescope/telescope.nvim",
    config = function()
      require ("plugins.telescope")
    end
  })
  use ("nvim-telescope/telescope-fzy-native.nvim")
  use ("tami5/sqlite.lua")
  use ({
    "neovim/nvim-lspconfig",
    config = function()
      require ("plugins.lspconfig")
    end
  })
  use ({
    "hrsh7th/nvim-cmp",
    config = function()
      require ("plugins.cmp")
    end
  })
  use ("hrsh7th/cmp-nvim-lsp")
  use ("saadparwaiz1/cmp_luasnip")
  use ("L3MON4D3/LuaSnip")
  use ("j-hui/fidget.nvim")

  end,
  config = {
    display = {
      open_fn = function()
        return utils.float({border = "rounded"})
      end
    }
  }
})
