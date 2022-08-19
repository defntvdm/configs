local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- package manager

    use 'navarasu/onedark.nvim' -- colorscheme

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
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

    use 'numToStr/Comment.nvim' -- commenter

    use 'gpanders/editorconfig.nvim' -- editorconfig

    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    } -- git highlight

    use 'mattn/emmet-vim' -- emmet
    use 'williamboman/mason.nvim' -- tools installer
    use 'williamboman/mason-lspconfig.nvim' -- lsp installer
    use 'neovim/nvim-lspconfig' -- lsp config
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'rafamadriz/friendly-snippets' -- snippets
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    } -- better lsp formatter
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    } -- better diagnostics

    use 'mfussenegger/nvim-dap' -- dap
    use 'rcarriga/nvim-dap-ui' -- dapui

    use {
        'nvim-neotest/neotest',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-neotest/neotest-python',
            'nvim-neotest/neotest-go',
        }
    } -- code tests
    use {
        'defntvdm/todos.nvim',
        config = function() require'todos'.setup() end
    } -- my simple todo plugin
end)
