local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'preservim/nerdcommenter'
    use 'majutsushi/tagbar'
    use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = 'fzf#install()' } }
    use 'Glench/Vim-Jinja2-Syntax'
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'psf/black', tag = '21.5b1' }
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'mbbill/undotree'
    use 'vim-scripts/spacehi.vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'vim-scripts/vcscommand.vim'
    use 'mhinz/vim-signify'
end)
