vim.o.background = "dark"
vim.o.colorcolumn = "150"
vim.o.cursorline = true
vim.o.diffopt = vim.o.diffopt .. ",vertical"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.exrc = true
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h15"
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
vim.o.title = true
vim.o.updatetime = 1000
vim.o.splitright = true
vim.o.splitbelow = true
vim.wo.signcolumn = "yes"

vim.cmd([[highlight Comment cterm=italic]])

vim.g.python3_host_prog = "/Users/defntvdm/.pyenv/shims/python3"
vim.g.user_emmet_leader_key = "<C-e>"

require("user.plugins")
require("user.hop")
require("user.indent-blankline")
require("user.lualine")
require("user.luatab")
require("user.surround")
require("user.telescope")
require("user.harpoon")
require("user.telekasten")
require("user.comment")
require("user.window-picker")
require("user.neo-tree")
require("user.au")
require("user.luasnip")
require("user.cmp")
require("user.colorscheme")
require("user.keymaps")
require("user.dap")
require("user.null-ls")
require("user.mason")
require("user.lsp")
require("user.crates")
require("user.symbols-outline")
require("user.treesitter")
require("user.neotest")
require("user.trouble")

local local_vimrc = vim.fn.getcwd() .. "/.localnvim"
if vim.loop.fs_stat(local_vimrc) then
    vim.cmd("source " .. local_vimrc)
end
