vim.o.background = 'dark'
vim.o.colorcolumn = '120'
vim.o.cursorline = true
vim.o.diffopt = vim.o.diffopt .. ',vertical'
vim.o.encoding = 'utf-8'
vim.o.expandtab = true
vim.o.exrc = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.secure = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.updatetime = 1000

vim.cmd [[colorscheme gruvbox]]
vim.cmd [[highlight Comment cterm=italic]]
vim.cmd [[autocmd FileType go set noexpandtab]]

vim.g.python3_host_prog = '/home/defntvdm/.pyenv/shims/python3'

require'plugins'
require'keymaps'

local local_vimrc = vim.fn.getcwd()..'/.localnvim'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end
