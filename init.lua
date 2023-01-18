require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

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
end)

vim.opt.signcolumn = 'yes'

-- Default keybindings, `:help lsp-zero-keybindings`
-- Configure LSP servers, `:help lsp-zero-api-showcase`
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- See :help lsp-zero-preferences
lsp.set_preferences({
  set_lsp_keymaps = true, -- False to configure your own keybindings
  manage_nvim_cmp = true, 
})

lsp.nvim_workspace()

lsp.setup()
