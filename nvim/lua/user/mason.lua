require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
        border = "rounded",
    },
})

require("mason-lspconfig").setup({
    automatic_installation = true,
})

require("mason-null-ls").setup({
    automatic_installation = true,
})

require("mason-nvim-dap").setup({
    automatic_installation = true,
})
