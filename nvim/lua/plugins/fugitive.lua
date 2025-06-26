return {
	"tpope/vim-fugitive",
	enabled = not vim.g.vscode,
	dependencies = {
		-- { "mhinz/vim-signify", lazy = false },
	},
	lazy = true,
	cmd = "Git",
}
