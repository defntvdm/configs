return {
	"AckslD/nvim-neoclip.lua",
	enabled = not vim.g.vscode,
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
