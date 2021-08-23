require'plugins'
require'plugins_config'
require'settings'
require'keymaps'
require'highlight'

local local_vimrc = vim.fn.getcwd()..'/.localnvim'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end
