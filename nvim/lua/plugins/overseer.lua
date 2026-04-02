return {
	"stevearc/overseer.nvim",
	enabled = not vim.g.vscode,
	keys = {
		{
			"<leader>or",
			function()
				require("overseer").run_task()
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
