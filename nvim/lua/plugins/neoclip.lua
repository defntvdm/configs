return {
	"AckslD/nvim-neoclip.lua",
	lazy = true,
	keys = {
		{
			"<leader>fc",
			function()
				require("neoclip.fzf")()
			end,
			mode = "n",
			noremap = false,
			silent = true,
			desc = "Clipboard",
		},
	},
	opts = {
		keys = {
			fzf = {
				select = "default",
				paste = "ctrl-p",
				paste_behind = "ctrl-k",
				custom = {},
			},
		},
	},
}
