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
vim.cmd("set list listchars=tab:··,trail:·")

-- Change the leader key
vim.cmd("let mapleader=','")

-- Switch tabs by pressing the leader key twice
vim.cmd("nnoremap <leader><leader> :BufferNext<CR>")

-- Close a buffer
vim.cmd("nnoremap <leader>q :BufferClose<CR>")

-- Find files using Telescope command-line sugar.
vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <leader>fg <cmd>Telescope live_grep<cr>")
vim.cmd("nnoremap <leader>fb <cmd>Telescope buffers<cr>")
vim.cmd("nnoremap <leader>fh <cmd>Telescope help_tags<cr>")
vim.cmd("nnoremap <leader>fp <cmd>Telescope projects<cr>")

-- Open LazyGit
vim.cmd("nnoremap <leader>g <cmd>LazyGit<cr>")

-- Open the Trouble panel
vim.cmd("nnoremap <leader>t <cmd>TroubleToggle<cr>")

-- Rust format
vim.cmd("nnoremap <leader>fr <cmd>%!rustfmt<cr>")

-- Make escape cancel the recent most recent search
vim.cmd("nnoremap <esc> :noh<return><esc>")

-- Bring up WhichKey
vim.cmd("nnoremap <silent> <leader> :WhichKey ','<CR>")

-- Add a keybinding to open the undo tree
vim.cmd("nnoremap <silent> <leader>u :UndotreeToggle<CR>")

-- Open the tagbar
vim.cmd("nnoremap <silent> <leader>j :TagbarToggle<CR>")

-- Keybinds for BetterTerm
local betterTerm = require("betterTerm")
-- Toggle terminal
vim.keymap.set({'n', 't'}, "<C-n>", betterTerm.open, { desc = "Open terminal"})
-- Select a terminal
vim.keymap.set({'n', 't'}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})
-- Create new terminal
local current = 2
vim.keymap.set(
    {'n', 't'}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)

-- Code runner with BetterTerm
vim.keymap.set("n", "<leader>e", function()
  require('betterTerm').send(require("code_runner.commands").get_filetype_command(), 1, true)
end, { desc = "Excute File"})

-- Spotify bindings
vim.cmd([[
nmap <leader>ss <Plug>(spotify-play/pause)
nmap <leader>sj <Plug>(spotify-next)
nmap <leader>sk <Plug>(spotify-prev)
nmap <leader>so <Plug>(spotify-show)
nmap <leader>sc <Plug>(spotify-status)
]])

-- Setup Discord presence
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = "info",                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

