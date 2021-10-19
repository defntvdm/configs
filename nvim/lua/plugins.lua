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
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/playground'

  use 'preservim/tagbar'
  -- use 'vim-scripts/vcscommand.vim'
  -- use 'mhinz/vim-signify'
  use '/home/defntvdm/arcadia/devtools/vim/plugin_bundles/signify'
  use '/home/defntvdm/arcadia/devtools/vim/plugin_bundles/vcscommand'
  use '/home/defntvdm/arcadia/devtools/vim/plugin_bundles/ya'

  use 'kristijanhusak/orgmode.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end

  require'inits.nvim-tree'
  require'inits.lualine'
  require'inits.lsp'
  require'inits.tree-sitter'
  require'inits.orgmode'
end)
