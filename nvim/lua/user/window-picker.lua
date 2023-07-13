return {
	"s1n7ax/nvim-window-picker",
	version = "2.*",
	dependencies = {
		"nvim-neo-tree/neo-tree.nvim",
	},
	lazy = true,
	opts = {
		autoselect_one = true,
		include_current = false,
		filter_rules = {
			bo = {
				filetype = { "neo-tree", "neo-tree-popup", "notify" },
				buftype = { "terminal", "quickfix" },
			},
		},
		other_win_hl_color = "#e35e4f",
	},
}
