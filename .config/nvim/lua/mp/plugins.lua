_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

local plugins = require ("packer")

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

  end
})
