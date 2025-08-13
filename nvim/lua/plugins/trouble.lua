local function diagnostics()
	require("trouble").toggle({
		focus = true,
		filter = {
			buf = 0,
		},
		mode = "diagnostics",
	})
end

return {
	"folke/trouble.nvim",
	enabled = not vim.g.vscode,
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<space>q",
			diagnostics,
			desc = "Buffer Diagnostics (Trouble)",
		},
	},
}
