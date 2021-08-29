local set_km = vim.api.nvim_set_keymap
vim.g.mapleader = '\\'
set_km('n', '<space>', '<nop>', { noremap = true, silent = true })

-- tab in completions
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

set_km('i', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], { silent = true })
set_km('i', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], { silent = true })
set_km('s', '<c-j>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], { silent = true })
set_km('s', '<c-k>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], { silent = true })

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
-- f9 - different formatters
-- f11 - undotree
set_km('n', '<f11>', ':UndotreeToggle<cr>', { noremap = true })
-- f12 - ctags
set_km('n', '<f12>', ':TagbarToggle<cr>', { noremap = true })
-- noop
set_km('i', '<f5>', '<nop>', { noremap = true })
set_km('i', '<f6>', '<nop>', { noremap = true })
set_km('i', '<f7>', '<nop>', { noremap = true })
set_km('i', '<f8>', '<nop>', { noremap = true })
set_km('i', '<f10>', '<nop>', { noremap = true })

-- telescope
set_km('n', '<leader>ff', ':Telescope find_files cwd=./', { noremap = true })
set_km('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true })
set_km('n', '<leader>fg', ':Telescope live_grep cwd=./', { noremap = true })

-- replace selected
set_km('v', '<c-r>', [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- copy/paste using system clipboard
set_km('v', '<c-c>c', '"+y', { noremap = true })
set_km('n', '<c-v>v', '"+P', { noremap = true })

-- new tab
set_km('n', '<c-t>', ':tabnew<cr>', { silent = true })

-- copy directory of current file
set_km('n', 'cp', [[:let @+=expand("%:p:h")<cr>]], { silent = true })
