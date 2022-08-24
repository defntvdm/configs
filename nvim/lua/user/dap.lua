require'user.dap.ui'
require'user.dap.go'
require'user.dap.py'
require'user.dap.rust'

vim.keymap.set('n', '<F9>', require 'dap'.toggle_breakpoint, { noremap = true })
vim.keymap.set('n', '<F5>', require 'dap'.continue, { noremap = true })
vim.keymap.set('n', '<F10>', require 'dap'.step_over, { noremap = true })
vim.keymap.set('n', '<F11>', require 'dap'.step_into, { noremap = true })
vim.keymap.set('n', '<F12>', require 'dap'.repl.open, { noremap = true })
vim.keymap.set('n', '<leader>dq', require'dapui'.toggle, { noremap = true })
