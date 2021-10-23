local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  use 'morhetz/gruvbox'

  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' }
  }

  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-colors.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/playground'
  use {
    'psf/black',
    tag = '21.9b0',
  }

  use 'preservim/tagbar'

  use 'vim-scripts/vcscommand.vim'
  use 'mhinz/vim-signify'

  use 'kristijanhusak/orgmode.nvim'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm i',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
