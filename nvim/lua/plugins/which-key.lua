return {
	"folke/which-key.nvim",
	enabled = not vim.g.vscode,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {},
}
