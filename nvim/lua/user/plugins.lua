local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}) end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- package manager

  use 'joshdick/onedark.vim' -- colorscheme

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'nvim-tree'.setup{} end
  } -- explorer

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  } -- status line

  use 'tpope/vim-surround' -- surround brackets
  use 'jiangmiao/auto-pairs' -- autopairs

  use 'junegunn/fzf' -- fuzzy finder core
  use 'junegunn/fzf.vim' -- fuzzy finder

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- treesitter

  use {
    'nvim-orgmode/orgmode',
    config = function()
      require'orgmode'.setup{}
    end
  } -- todos

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  } -- telescope

  use 'gpanders/editorconfig.nvim' -- editorconfig

  use 'neovim/nvim-lspconfig' -- lsp clients
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use {
    'psf/black',
    tag = '22.3.0',
  } -- python formatter

end)
