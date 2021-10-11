vim.g.black_linelength = 120
vim.g.black_skip_string_normalization = 1
vim.g.black_fast = 0

vim.cmd([[
autocmd FileType python nmap <C-i> :Black<cr>
]])
