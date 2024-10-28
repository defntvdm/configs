return {
	"ThePrimeagen/refactoring.nvim",
	mode = "v",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<space>rr",
			function()
				require("refactoring").select_refactor({ show_success_message = true })
			end,
			mode = "v",
			noremap = true,
		},
	},
	ft = defntvdm_filetypes,
	opts = {},
}
