local packer = require "packer"
local util = require "packer.util"

packer.startup({
  function(use)

    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("lewis6991/gitsigns.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("feline-nvim/feline.nvim")
    use("akinsho/bufferline.nvim")
    use("MunifTanjim/nui.nvim")
    use("VonHeikemen/fine-cmdline.nvim")
    use("VonHeikemen/searchbox.nvim")
    use("rcarriga/nvim-notify")
    use("nvim-lua/popup.nvim")

    use("nvim-telescope/telescope.nvim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})

    use("tamago324/lir.nvim")
    use("tamago324/lir-git-status.nvim")

    use("navarasu/onedark.nvim")
    use("tanvirtin/monokai.nvim")
    use({"rose-pine/neovim", as = "rose-pine"})

    use("nvim-treesitter/nvim-treesitter")
    use("neovim/nvim-lspconfig")

  end,
  config = {
    display = {
      open_fn = function()
        return util.float({border = "rounded"})
      end
    }
  }
})
