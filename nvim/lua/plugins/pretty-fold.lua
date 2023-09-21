return {
	"anuvyklack/pretty-fold.nvim",
	event = "VeryLazy",
	opts = {
		keep_indentation = true,
		fill_char = "━",
		sections = {
			left = {
				"content",
			},
			right = {
				"┫ ",
				"number_of_folded_lines",
				" ┣━━",
			},
		},
	},
}
