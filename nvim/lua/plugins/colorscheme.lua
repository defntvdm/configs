return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("nightfox").setup({
			options = {
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled",
				transparent = false,
				terminal_colors = true,
				dim_inactive = false,
				module_default = true,
				colorblind = {
					enable = false,
					simulate_only = false,
					severity = {
						protan = 0,
						deutan = 0,
						tritan = 0,
					},
				},
				styles = {
					comments = "italic",
					conditionals = "NONE",
					constants = "bold",
					functions = "NONE",
					keywords = "bold,italic",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "bold",
					variables = "NONE",
				},
				inverse = {
					match_paren = false,
					visual = false,
					search = false,
				},
				modules = {
					cmp = true,
					["dap-ui"] = true,
					gitsigns = true,
					hop = true,
					indent_blanklines = true,
					["lazy.nvim"] = true,
					lsp_trouble = true,
					neotree = true,
					notify = true,
					signify = true,
					telescope = true,
					treesitter = true,
					whichkey = true,
				},
			},
			palettes = {},
			specs = {},
			groups = {},
		})
		vim.cmd("colorscheme nightfox")
	end,
}
