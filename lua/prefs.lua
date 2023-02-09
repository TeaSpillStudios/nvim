--[[require('onedark').setup {
    style = 'darker'
}
require('onedark').load()]]--

vim.cmd.colorscheme "catppuccin-mocha"

vim.cmd("set rnu nu")
vim.cmd("set clipboard+=unnamedplus")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")

vim.cmd("set shiftwidth=4 tabstop=4 softtabstop=4 smarttab")

vim.g.mapleader = " "

vim.g.rustfmt_autosave = 1
