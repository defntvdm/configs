return {
	"s1n7ax/nvim-window-picker",
	version = "2.*",
	dependencies = {
		"nvim-neo-tree/neo-tree.nvim",
	},
	lazy = true,
	opts = {
		hint = "floating-big-letter",
		autoselect_one = true,
		include_current = false,
		filter_rules = {
			bo = {
				filetype = { "neo-tree", "neo-tree-popup", "notify" },
				buftype = { "terminal", "quickfix" },
			},
		},
	},
}
