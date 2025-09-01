return {
	"folke/flash.nvim",
	event = "BufEnter",
	keys = {
		{
			"S",
			mode = "n",
			function()
				require("flash").treesitter_search()
			end,
		},
	},
	opts = {},
}
