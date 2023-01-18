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
