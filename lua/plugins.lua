require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- Commentary functionality
  use "tpope/vim-commentary"

  -- Font requirement
  use "nvim-tree/nvim-web-devicons"

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  -- Autopairing
  use "windwp/nvim-autopairs"

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

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
  use "rust-lang/rust.vim"

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- Quick jumping
  use "ggandor/leap.nvim"

  -- Theme
  -- use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- use "EdenEast/nightfox.nvim"
  -- use 'folke/tokyonight.nvim'

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

  -- Fuzzy find
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Floating terminal
  use 'voldikss/vim-floaterm'

  -- Git signs
  use "lewis6991/gitsigns.nvim"
end)

-- Plugin setups

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- NVim-Notify
vim.notify = require("notify")

-- Git signs
require('gitsigns').setup()

-- Leap
require('leap').add_default_mappings()

-- Autopairs
require("nvim-autopairs").setup {}
