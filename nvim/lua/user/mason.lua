require'mason'.setup{
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require'mason-lspconfig'.setup{
    ensure_installed = {
        'bashls',
        'ccls',
        'clangd',
        'cmake',
        'cssls',
        'dockerls',
        'gopls',
        'graphql',
        'html',
        'jsonls',
        'pyright',
        'rust_analyzer',
        'sumneko_lua',
        'taplo',
        'tsserver',
        'vimls',
        'vuels',
        'yamlls',
    }
}
