require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "c", "cmake", "cpp", "css", "dockerfile", "go", "gomod", "graphql", "html", "javascript", "json",
        "lua", "python", "rust", "toml", "tsx", "typescript", "vue", "yaml",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
