local set_km = vim.keymap.set
vim.g.mapleader = '\\'
set_km('n', '<space>', '<nop>', { noremap = true, silent = true })

set_km('i', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], { silent = true })
set_km('i', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { silent = true })
set_km('s', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], { silent = true })
set_km('s', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { silent = true })

-- tabs
set_km('n', '<m-1>', '1gt', { noremap = true, silent = true })
set_km('n', '<m-2>', '2gt', { noremap = true, silent = true })
set_km('n', '<m-3>', '3gt', { noremap = true, silent = true })
set_km('n', '<m-4>', '4gt', { noremap = true, silent = true })
set_km('n', '<m-5>', '5gt', { noremap = true, silent = true })
set_km('n', '<m-6>', '6gt', { noremap = true, silent = true })
set_km('n', '<m-7>', '7gt', { noremap = true, silent = true })
set_km('n', '<m-8>', '8gt', { noremap = true, silent = true })
set_km('n', '<m-9>', '9gt', { noremap = true, silent = true })
set_km('n', '<m-0>', '<cmd>tablast<CR>', { noremap = true, silent = true })
set_km('n', '¡', '1gt', { noremap = true, silent = true })
set_km('n', '™', '2gt', { noremap = true, silent = true })
set_km('n', '£', '3gt', { noremap = true, silent = true })
set_km('n', '¢', '4gt', { noremap = true, silent = true })
set_km('n', '∞', '5gt', { noremap = true, silent = true })
set_km('n', '§', '6gt', { noremap = true, silent = true })
set_km('n', '¶', '7gt', { noremap = true, silent = true })
set_km('n', '•', '8gt', { noremap = true, silent = true })
set_km('n', 'ª', '9gt', { noremap = true, silent = true })
set_km('n', 'º', '<cmd>tablast<CR>', { noremap = true, silent = true })

-- noop
set_km('i', '<f1>', '<nop>', { noremap = true })
set_km('i', '<f2>', '<nop>', { noremap = true })
set_km('i', '<f3>', '<nop>', { noremap = true })
set_km('i', '<f4>', '<nop>', { noremap = true })
set_km('i', '<f5>', '<nop>', { noremap = true })
set_km('i', '<f6>', '<nop>', { noremap = true })
set_km('i', '<f7>', '<nop>', { noremap = true })
set_km('i', '<f8>', '<nop>', { noremap = true })
set_km('i', '<f9>', '<nop>', { noremap = true })
set_km('i', '<f10>', '<nop>', { noremap = true })
set_km('i', '<f11>', '<nop>', { noremap = true })
set_km('i', '<f12>', '<nop>', { noremap = true })

-- Telescope
set_km('n', '<leader>ff', ':Telescope find_files cwd=', { noremap = true })
set_km('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
set_km('n', '<leader>fg', ':Telescope live_grep cwd=', { noremap = true })
set_km('n', '<leader>fig', ':Telescope grep_string cwd=', { noremap = true })
set_km('n', '<leader>ft', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })

-- markdown-preview.nvim
set_km('n', '<leader>mm', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })

-- replace selected
set_km('v', '<c-r>', [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- move line
set_km('n', '<m-j>', [[:m .+1<CR>==]], { noremap = true, silent = true })
set_km('n', '<m-k>', [[:m .-2<CR>==]], { noremap = true, silent = true })
set_km('v', '<m-j>', [[:m '>+1<CR>gv=gv]], { noremap = true, silent = true })
set_km('v', '<m-k>', [[:m '<-2<CR>gv=gv]], { noremap = true, silent = true })
set_km('n', '∆', [[:m .+1<CR>==]], { noremap = true, silent = true })
set_km('n', '˚', [[:m .-2<CR>==]], { noremap = true, silent = true })
set_km('v', '∆', [[:m '>+1<CR>gv=gv]], { noremap = true, silent = true })
set_km('v', '˚', [[:m '<-2<CR>gv=gv]], { noremap = true, silent = true })

-- copy/paste using system clipboard
set_km('v', '<c-c>c', '"+y', { noremap = true })
set_km('n', '<c-v>v', '"+P', { noremap = true })

-- new tab
set_km('n', '<c-t>', '<cmd>tabnew<CR>', { silent = true })

-- copy directory of current file
set_km('n', 'cp', [[:let @+=expand("%:p:h")<CR>]], { silent = true })
