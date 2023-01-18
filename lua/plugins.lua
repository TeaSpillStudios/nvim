require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- Font requirement
  use "nvim-tree/nvim-web-devicons"

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',

    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Rust tools
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- Theme
  use 'navarasu/onedark.nvim'

  -- Bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP issue panel
  use "folke/trouble.nvim"

  -- Buffer list
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Notifications
  use "rcarriga/nvim-notify"

  -- Git control
  use "kdheepak/lazygit.nvim"
end)

-- Plugin setups

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- NVim-Notify
vim.notify = require("notify")
