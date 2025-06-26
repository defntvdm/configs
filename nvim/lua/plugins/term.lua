return {
	"akinsho/toggleterm.nvim",
	enabled = not vim.g.vscode,
	keys = {
		{
			"<F2>",
			"<cmd>ToggleTerm<cr>",
			mode = { "n", "t" },
		},
		{
			"<C-`>",
			"<cmd>ToggleTerm<cr>",
			mode = { "n", "t" },
		},
	},
	opts = {
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 0,
			title_pos = "center",
		},
	},
}
