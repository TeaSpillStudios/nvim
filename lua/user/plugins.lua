-- ensure the packer plugin manager is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Collection of common configurations for the Nvim LSP client
  use "neovim/nvim-lspconfig"

  -- Visualize LSP progress
  use({ "j-hui/fidget.nvim", config = function() require("fidget").setup() end })

  -- Autocompletion framework
  use "hrsh7th/nvim-cmp"

  use({
    -- CMP LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- CMP nippet completion
    "hrsh7th/cmp-vsnip",
    -- CMP path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })

  -- Snippet engine
  use "hrsh7th/vim-vsnip"

  -- Adds extra functionality over rust analyzer
  use "simrat39/rust-tools.nvim"

  -- Rust support
  use "rust-lang/rust.vim"

  -- Dependencies
  use "nvim-lua/popup.nvim"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"
  use "rcarriga/nvim-notify"

  -- Fuzzy finder
  use "nvim-telescope/telescope.nvim"

  -- Some color scheme other then default
  use "shaunsingh/nord.nvim"

  -- Add a tab bar
  use {"romgrk/barbar.nvim", wants = "nvim-web-devicons"}

  -- Add a status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Add a panel to view tags
  use "preservim/tagbar"

  -- Add a startup panel
  use "goolord/alpha-nvim"

  -- Add automatic pairing
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use "tpope/vim-surround"

  -- Open LazyGit inside of NeoVim
  use "kdheepak/lazygit.nvim"

  -- Trouble panel
  use { "folke/trouble.nvim", requires = "nvim-web-devicons", config = function() require("trouble").setup {} end }

  -- Add modifications of a git repository signs
  use "airblade/vim-gitgutter"

  -- Add a tree for undos
  use "sanfusu/neovim-undotree"

  -- Add a plugin to comment things out quickly
  use "tpope/vim-commentary"

  -- Add a better terminal
  use { "CRAG666/betterTerm.nvim", config = function() require("betterTerm").setup() end }

  -- Add a code runner
  use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim", config = function() require("code_runner").setup({ filetype = { rust = "cd $dir && cargo run" } }) end }

  -- Control spotify from NeoVim
  use "stsewd/spotify.nvim"

  -- Discord presence
  use "andweeb/presence.nvim"

  -- Project, allowing to navigate projects
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup { patterns = {".git", "Makefile", "package.json", "Gemfile", ".prj", "Cargo.toml" } } end }

  -- Syntax highlighting and filetype detection for the RON format.
  use "ron-rs/ron.vim"

  -- MDX support
  use "jxnblk/vim-mdx-js"
end)

-- the first run will install packer and the plugins
if packer_bootstrap then
  require("packer").sync()
  return
end
