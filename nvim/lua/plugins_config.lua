require'my.lsp' -- nvim-lsp
require'my.cmp' -- nvim-cmp
require'my.treesitter' -- nvim-treesitter

require'surround'.setup{} -- surround.nvim

-- lualine.nvim
require'lualine'.setup{
    options = {
        theme = 'gruvbox',
    },
}

-- telescope.nvim
require'telescope'.setup{
    sorting_strategy = 'ascending',
}

-- black
vim.g.black_linelength = 120
vim.g.black_skip_string_normalization = 1
vim.g.black_fast = 0

vim.cmd([[
autocmd FileType python nmap <F9> :Black<cr>
]])
