return {
	"stevearc/overseer.nvim",
	keys = {
		{
			"<leader>or",
			function()
				require("overseer").run_template()
			end,
			mode = "n",
		},
		{
			"<leader>ot",
			function()
				require("overseer").toggle()
			end,
			mode = "n",
		},
	},
	opts = {
		templates = { "builtin" },
	},
}
