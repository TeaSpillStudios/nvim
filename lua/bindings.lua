function map(lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap("n", lhs, rhs, options)
end

map("<Leader>fe", ":Neotree<CR>")
map("<Leader>tt", ":TroubleToggle<CR>")
map("<Leader>gg", ":LazyGit<CR>")
map("<Leader>a", ":AerialToggle!<CR>")
map("<Leader>ff", ":Telescope find_files<CR>")
map("<Leader>ft", ":FloatermToggle <CR>")
map("<esc>", ":nohlsearch<CR>")
