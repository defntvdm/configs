return {
	"akinsho/toggleterm.nvim",
	keys = {
		{
			"<C-=>",
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
