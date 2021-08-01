local set_km = vim.api.nvim_set_keymap
vim.g.mapleader = '\\'
set_km('n', '<space>', '<nop>', { noremap = true, silent = true })

-- movement HJKL
set_km('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
set_km('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
set_km('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
set_km('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

-- tab in completions
set_km('i', '<tab>', [[pumvisible() ? "\<c-n>" : "\<tab>"]], { noremap = true, silent = true, expr = true })
set_km('i', '<s-tab>', [[pumvisible() ? "\<c-p>" : "\<s-tab>"]], { noremap = true, silent = true, expr = true })

-- NERDTree
set_km('n', '<c-n>', ':NERDTreeToggle<cr>', { noremap = true, silent = true })

-- FXX
-- f1 - help
--f2 - save
set_km('i', '<f2>', '<esc>:w<cr>', { noremap = true })
set_km('n', '<f2>', ':w<cr>', { noremap = true })
-- f3 - trailing space highlight
-- f4 - cut trailing whitespaces
set_km('n', '<f4>', [[:%s/\s\+$//e<cr>]], { noremap = true })
-- f5 - buffers
set_km('n', '<f5>', [[:%s/\s\+$//e<cr>]], { noremap = true })
-- f9 - different formatters
-- f11 - undotree
set_km('n', '<f11>', ':UndotreeToggle<cr>', { noremap = true })
-- f12 - ctags
set_km('n', '<f12>', ':TagbarToggle<cr>', { noremap = true })
-- noop
set_km('i', '<f6>', '<nop>', { noremap = true })
set_km('i', '<f7>', '<nop>', { noremap = true })
set_km('i', '<f8>', '<nop>', { noremap = true })
set_km('i', '<f10>', '<nop>', { noremap = true })

-- coc.nvim
set_km('n', 'gc', ':CocCommand clangd.switchSourceHeader<cr>', { silent = true })
set_km('n', 'gd', '<Plug>(coc-definition)', { silent = true })
set_km('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
set_km('n', 'gr', '<Plug>(coc-references)', { silent = true })
set_km('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
set_km('n', '<leader>r', '<Plug>(coc-rename)', { silent = true })
set_km('i', '<c-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
set_km('n', '<leader>d', ':CocDiagnostics<cr>', { silent = true })
set_km('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
set_km('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
set_km('n', '<f9>', ':CocCommand prettier.formatFile<cr>', { silent = true })

-- ack
set_km('n', '<leader>a', ':Ack!<space>', { noremap = true })

-- fzf
vim.cmd([[let $FZF_DEFAULT_COMMAND='find . \( -path ./.git -o -path ./.venv -o -path vendor -o -path .mypy_cache \) -prune -o -print']])
set_km('n', '<leader>f', ':Files!<cr>', { noremap = true })

-- replace selected
set_km('v', '<c-r>', [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- copy/paste using system clipboard
set_km('v', '<c-c>c', '"+y', { noremap = true })
set_km('n', '<c-v>v', '"+P', { noremap = true })

-- new tab
set_km('n', '<c-t>', ':tabnew<cr>', { silent = true })

-- copy directory of current file
set_km('n', 'cp', [[:let @+=expand("%:p:h")<cr>]], { silent = true })
