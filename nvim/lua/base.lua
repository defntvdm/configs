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
vim.o.listchars = "eol:$"
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

vim.g.python3_host_prog = "/Users/defntvdm/.pyenv/shims/python3"

local myaugroup = vim.api.nvim_create_augroup("defntvdm_custom", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight copied text",
	group = myaugroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Switch relativenumber off",
	group = myaugroup,
	callback = function()
		if vim.o.number then
			vim.o.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	desc = "Switch relativenumber on",
	group = myaugroup,
	callback = function()
		if vim.o.number then
			vim.o.relativenumber = true
		end
	end,
})
