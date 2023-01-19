require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

vim.cmd("set rnu nu")
vim.cmd("set clipboard+=unnamedplus")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

vim.g.mapleader = " "
