local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--> Set menu config for cmp
vim.cmd('set completeopt=menu,menuone,noselect')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --> Speed up loading times with impatient.nvim
  use 'lewis6991/impatient.nvim'
  require('impatient')

  use 'arcticicestudio/nord-vim'

  --> CMP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  --> Use VSnip
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  --> Languages
  use 'stefanos82/nelua.vim'

  --> Status bar
  use 'vim-airline/vim-airline'

  --> Tabs
  use ({ 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })

  --> TODO: comments
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('todo-comments').setup {} end }

  --> Trouble
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require('trouble').setup {} end }

  --> Lazy git
  use 'kdheepak/lazygit.nvim'

  --> Telescope
  use ({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }, config = function() require("telescope").load_extension("lazygit") end })

  --> Show information of modifications in git repositories
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }

  --> Setup autopairs
  use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }

  --> Setup project (a way to navigate projects)
  use { 'ahmedkhalf/project.nvim', config = function() require("project_nvim").setup { patterns = {".git", "Makefile", "package.json", "Gemfile", ".prj", "Cargo.toml" } } end }

  --> Setup illuminate
  use 'RRethy/vim-illuminate'

  --> Setup MD file syntax highlighting
  use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end })

  --> Writing
  use "TeaSpillStudios/AbbrevMan.nvim"
  use "preservim/vim-litecorrect"
  use "preservim/vim-lexical"
  use "preservim/vim-pencil"
  use "preservim/vim-wheel"
  use "preservim/vim-wordy"

  --> Multiple cursors
  use 'mg979/vim-visual-multi'

  --> Have startup dashboard
  use 'goolord/alpha-nvim'

  --> Discord RPC
  use 'andweeb/presence.nvim'

  --> Add plugin for commenting out lines quickly
  use 'tpope/vim-commentary'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
