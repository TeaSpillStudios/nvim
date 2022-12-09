-- Change to the nord colourscheme
vim.cmd("colo nord")

-- Enable relative numbering
vim.opt.relativenumber = true

-- Enable normal numbering
vim.opt.number = true

-- Enable column for displaying signs
vim.opt.signcolumn = "yes"

-- Set the clipboard type to unnamedplus to allow copying to the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable the undo file
vim.opt.undofile = true

-- Shorten the update time
vim.opt.updatetime = 300

-- Change the shift width
vim.opt.shiftwidth = 2

-- Enable the cursor line
vim.opt.cursorline = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Display trailing characters
vim.cmd('set list listchars=tab:··,trail:·')

-- Change the leader key
vim.cmd('let mapleader=","')

-- Switch tabs by pressing the leader key twice
vim.cmd('nnoremap <leader><leader> :BufferNext<CR>')

-- Close a buffer
vim.cmd('nnoremap <leader>q :BufferClose<CR>')

-- Find files using Telescope command-line sugar.
vim.cmd('nnoremap <leader>ff <cmd>Telescope find_files<cr>')
vim.cmd('nnoremap <leader>fg <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>fb <cmd>Telescope buffers<cr>')
vim.cmd('nnoremap <leader>fh <cmd>Telescope help_tags<cr>')
vim.cmd('nnoremap <leader>fp <cmd>Telescope projects<cr>')

-- Open LazyGit
vim.cmd('nnoremap <leader>g <cmd>LazyGit<cr>')

-- Open the Trouble panel
vim.cmd('nnoremap <leader>t <cmd>TroubleToggle<cr>')

-- Rust format
vim.cmd('nnoremap <leader>fr <cmd>%!rustfmt<cr>')

-- Make escape cancel the recent most recent search
vim.cmd('nnoremap <esc> :noh<return><esc>')

-- Bring up WhichKey
vim.cmd("nnoremap <silent> <leader> :WhichKey ','<CR>")

-- Add a keybinding to open the undo tree
vim.cmd("nnoremap <silent> <leader>u :UndotreeToggle<CR>")

-- Open the tagbar
vim.cmd("nnoremap <silent> <leader>j :TagbarToggle<CR>")
