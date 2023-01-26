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

-- fzf.vim
set_km('n', '<leader>ff', ':Files ', { noremap = true })
set_km('n', '<leader>fb', '<cmd>Buffers<CR>', { noremap = true, silent = true })
vim.cmd [[
function! RipgrepFzf(directory)
  let command_fmt = 'rg --column --line-number --no-heading --color=always %s %s || true'
  let initial_command = printf(command_fmt, '""', a:directory)
  let reload_command = printf(command_fmt, '{q}', a:directory)
  let spec = {'options': ['--phony', '--query', '', '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
endfunction

function! RipgrepIgnoreCaseFzf(directory)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --ignore-case %s %s || true'
  let initial_command = printf(command_fmt, '""', a:directory)
  let reload_command = printf(command_fmt, '{q}', a:directory)
  let spec = {'options': ['--phony', '--query', '', '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
endfunction

command! -nargs=* -complete=dir RG call RipgrepFzf(<f-args>)
command! -nargs=* -complete=dir RIG call RipgrepIgnoreCaseFzf(<f-args>)
]]
set_km('n', '<leader>ft', '<cmd>BTags<CR>', { noremap = true, silent = true })
set_km('n', '<leader>fg', ':RG<space>', { noremap = true })
set_km('n', '<leader>fig', ':RIG<space>', { noremap = true })

-- markdown-preview.nvim
set_km('n', '<leader>mm', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })

-- replace selected
set_km('v', '<c-r>', [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- copy/paste using system clipboard
set_km('v', '<c-c>c', '"+y', { noremap = true })
set_km('n', '<c-v>v', '"+P', { noremap = true })

-- new tab
set_km('n', '<c-t>', '<cmd>tabnew<CR>', { silent = true })

-- copy directory of current file
set_km('n', 'cp', [[:let @+=expand("%:p:h")<CR>]], { silent = true })
