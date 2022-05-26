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
      require ("plugins.telescope.setup")
    end
  })
  use ("nvim-telescope/telescope-fzy-native.nvim")

  end,
  config = {
    display = {
      open_fn = function()
        return utils.float({border = "rounded"})
      end
    }
  }
})
