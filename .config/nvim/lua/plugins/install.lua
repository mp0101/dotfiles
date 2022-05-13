_ = vim.cmd[[packadd packer.nvim]]

local packer = require 'packer'
local util = require 'packer.util'

packer.startup({
  function(use)
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    use({
      'nvim-treesitter/nvim-treesitter',
      run = 'Update'
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
