return {
	"yorickpeterse/nvim-pqf",
	enabled = not vim.g.vscode,
	event = "VeryLazy",
	opts = {
		signs = {
			error = "E",
			warning = "W",
			info = "I",
			hint = "H",
		},
		show_multiple_lines = false,
		max_filename_length = 0,
	},
}
