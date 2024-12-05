vim.o.autoread = true
vim.o.background = "dark"
vim.o.colorcolumn = "+1"
vim.o.cursorline = true
vim.o.diffopt = vim.o.diffopt .. ",vertical"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.exrc = true
vim.o.fileencoding = "utf-8"
vim.o.foldenable = true
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = require("foldtext")
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.listchars = "eol:$,lead:<,trail:>,space:.,tab:|-"
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 3
vim.o.secure = true
vim.o.shiftwidth = 4
vim.o.sidescrolloff = 3
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.textwidth = 150
vim.o.title = true
vim.o.updatetime = 1000
vim.scriptencoding = "utf-8"

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h14"
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_vfx_mode = "ripple"
end

vim.g.python3_host_prog = "/home/defntvdm/.pyenv/shims/python3"
