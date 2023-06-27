local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local packer = require("packer")

packer.init({
    max_jobs = 10,
})

packer.startup(function(use)
    use("sindrets/diffview.nvim") -- git diff
    use("wbthomason/packer.nvim") -- package manager

    use("navarasu/onedark.nvim") -- colorscheme

    use({
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
    }) -- picker for neotree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    }) -- explorer

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })                                                                             -- status line
    use({ "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- tabbar

    use("kylechui/nvim-surround")                                                  -- surround brackets
    use("jiangmiao/auto-pairs")                                                    -- autopairs

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            "edolphin-ydf/goimpl.nvim",
        },
    }) -- telescope

    use({
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "nvim-treesitter/playground",
        },
        run = ":TSUpdate",
    })                                          -- treesitter
    use("nvim-treesitter/nvim-treesitter-context") -- context

    use("numToStr/Comment.nvim")                -- commenter

    use("gpanders/editorconfig.nvim")           -- editorconfig
    use({
        "tpope/vim-fugitive",
        requires = { "mhinz/vim-signify" },
    })                                      -- git

    use("mattn/emmet-vim")                  -- emmet
    use("williamboman/mason.nvim")          -- tools installer
    use("williamboman/mason-lspconfig.nvim") -- lsp installer
    use("jay-babu/mason-null-ls.nvim")      -- tools installer
    use("jay-babu/mason-nvim-dap.nvim")     -- dap installer
    use("neovim/nvim-lspconfig")            -- lsp config
    use("lvimuser/lsp-inlayhints.nvim")     -- lsp inlay hints
    use("simrat39/symbols-outline.nvim")    -- symbols from lsp
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- lsp signatures
    use("hrsh7th/nvim-cmp")                 -- Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp")             -- LSP source for nvim-cmp
    use("hrsh7th/cmp-buffer")               -- buffer completions
    use("hrsh7th/cmp-path")                 -- path completions
    use("hrsh7th/cmp-cmdline")              -- cmdline completion
    use("saadparwaiz1/cmp_luasnip")         -- Snippets source for nvim-cmp
    use("L3MON4D3/LuaSnip")                 -- Snippets plugin
    use("rafamadriz/friendly-snippets")     -- snippets
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }) -- better lsp formatter
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })                        -- better diagnostics

    use("mfussenegger/nvim-dap") -- dap
    use("rcarriga/nvim-dap-ui") -- dapui

    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
        },
    }) -- code tests

    use({
        "lukas-reineke/indent-blankline.nvim",
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    use({
        "renerocksai/telekasten.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
    }) -- notes

    use({
        "ThePrimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }) -- marks harpoon

    use({
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
    }) -- rust crates
end)
