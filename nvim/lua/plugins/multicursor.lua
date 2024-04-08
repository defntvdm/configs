return {
	"smoka7/multicursors.nvim",
	event = "VeryLazy",
	dependencies = {
		"smoka7/hydra.nvim",
	},
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	keys = {
		{
			mode = { "v", "n" },
			"<leader>.",
			"<cmd>MCstart<cr>",
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
	opts = {},
}
