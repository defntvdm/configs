local set_km = vim.api.nvim_set_keymap
vim.g.mapleader = '\\'
set_km('n', '<space>', '<nop>', { noremap = true, silent = true })
set_km('n', '<c-P>', ':', { noremap = true })

set_km('i', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], { silent = true })
set_km('i', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], { silent = true })
set_km('s', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], { silent = true })
set_km('s', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], { silent = true })

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
set_km('n', '<m-0>', ':tablast<cr>', { noremap = true, silent = true })

-- nvim-tree.lua
set_km('n', '<c-n>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
set_km('n', 'ff', ':NvimTreeFindFile<cr>', { noremap = true, silent = true })
vim.cmd[[
autocmd FileType NvimTree nnoremap <buffer><silent> h :lua require'nvim-tree.actions'.on_keypress('close_node')<cr>
autocmd FileType NvimTree nnoremap <buffer><silent> l :lua require'nvim-tree.actions'.on_keypress('edit')<cr>
]]

-- FXX
-- f4 - cut trailing whitespaces
set_km('n', '<f4>', [[:%s/\s\+$//e<cr>]], { noremap = true })
-- f12 - ctags
set_km('n', '<f12>', ':TagbarToggle<cr>', { noremap = true })
-- noop
set_km('i', '<f1>', '<nop>', { noremap = true })
set_km('i', '<f2>', '<nop>', { noremap = true })
set_km('i', '<f5>', '<nop>', { noremap = true })
set_km('i', '<f6>', '<nop>', { noremap = true })
set_km('i', '<f7>', '<nop>', { noremap = true })
set_km('i', '<f8>', '<nop>', { noremap = true })
set_km('i', '<f9>', '<nop>', { noremap = true })
set_km('i', '<f10>', '<nop>', { noremap = true })
set_km('i', '<f11>', '<nop>', { noremap = true })

-- fzf.vim
set_km('n', '<leader>ff', ':Files<space>', { noremap = true })
set_km('n', '<leader>fb', ':Buffers<cr>', { noremap = true, silent = true })
vim.cmd [[
function! RipgrepFzf(directory)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --ignore-case %s %s || true'
  let initial_command = printf(command_fmt, '""', a:directory)
  let reload_command = printf(command_fmt, '{q}', a:directory)
  let spec = {'options': ['--phony', '--query', '', '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
endfunction

command! -nargs=* -complete=dir RG call RipgrepFzf(<f-args>)
]]
set_km('n', '<leader>ft', ':BTags<cr>', { noremap = true, silent = true })
set_km('n', '<leader>fg', ':RG<space>', { noremap = true })

-- vimgrep
-- set_km('n', '<leader>fg', ':vimgrep<space>', { noremap = true })
set_km('n', '<leader>n', ':cnext<cr>', { noremap = true })
set_km('n', '<leader>p', ':cprev<cr>', { noremap = true })

-- replace selected
set_km('v', '<c-r>', [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- copy/paste using system clipboard
set_km('v', '<c-c>c', '"+y', { noremap = true })
set_km('n', '<c-v>v', '"+P', { noremap = true })

-- new tab
set_km('n', '<c-t>', ':tabnew<cr>', { silent = true })

-- copy directory of current file
set_km('n', 'cp', [[:let @+=expand("%:p:h")<cr>]], { silent = true })

-- black
vim.g.black_linelength = 120
vim.g.black_skip_string_normalization = true
