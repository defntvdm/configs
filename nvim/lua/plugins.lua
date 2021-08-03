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
    use 'scrooloose/nerdtree'
    use 'preservim/nerdcommenter'
    use 'ryanoasis/vim-devicons'
    use 'fatih/vim-go'
    use 'majutsushi/tagbar'
    use 'mileszs/ack.vim'
    use 'junegunn/fzf.vim'
    use 'Glench/Vim-Jinja2-Syntax'
    use 'vim-airline/vim-airline'
    use 'tpope/vim-surround'
    use { 'psf/black', tag = '21.5b1' }
    use 'jiangmiao/auto-pairs'
    use 'mbbill/undotree'
    use 'vim-scripts/spacehi.vim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'hrsh7th/nvim-compe'
    use 'L3MON4D3/LuaSnip'
    use 'vim-scripts/vcscommand.vim'
    use 'mhinz/vim-signify'
end)
