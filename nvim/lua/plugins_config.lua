-- coc.nvim
vim.g.coc_global_extensions = {
    "coc-json", "coc-tsserver", "coc-clangd", "coc-pyright", "coc-go", "coc-rust-analyzer", 
    "coc-cmake", "coc-emmet", "coc-vetur", "coc-prettier", "coc-yaml", "coc-snippets"}

-- vim.go
vim.g.go_auto_sameids = 0
vim.g.go_gopls_enabled = 0
vim.g.go_def_mapping_enabled = 0
vim.g.go_fmt_command = 'goimports'
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1

-- black
vim.g.black_linelength = 120
vim.g.black_skip_string_normalization = 1
vim.g.black_fast = 0

vim.cmd([[
autocmd FileType html,css,javascriptreact,typescriptreact,vue EmmetInstall
autocmd FileType python nmap <F9> :Black<CR>:w<CR>
autocmd FileType cpp nmap <F9> :ClangFormat<CR>:w<CR>
]])
