_ = vim.cmd[[packadd packer.nvim]]

local packer = require 'packer'
local util = require 'packer.util'

packer.startup({
  function(use)
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    use({
      'nvim-treesitter/nvim-treesitter',
      requires = {{'nvim-treesitter/nvim-treesitter-refactor'},
        'nvim-treesitter/nvim-treesitter-textobjects'}
    })
    use({
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/plenary.nvim'}}
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use("nvim-telescope/telescope-file-browser.nvim")
    use({
      'tamago324/lir.nvim',
      requires = {{'tamago324/lir-git-status.nvim'},
      'kyazdani42/nvim-web-devicons'}
    })
    use({
      "windwp/nvim-autopairs",
      config = function()
        require('nvim-autopairs').setup()
      end
    })
    use({
      "akinsho/bufferline.nvim",
      config = function()
        require('bufferline').setup()
      end
    })
    use({
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    })

    use("nvim-lualine/lualine.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use('tjdevries/colorbuddy.nvim')
    use('bkegley/gloombuddy')
    use('rebelot/kanagawa.nvim')

end,
config = {
  display = {
    open_fn = function()
      return util.float( { border = 'rounded' } )
    end
  }
}})
