local api = require'nvim-tree.api'

require'nvim-tree'.setup{
    on_attach = function(bufnr)
        vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr, noremap = true, silent = true })
    end,
}

vim.keymap.set('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ff', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

