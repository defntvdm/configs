return {
	"mbbill/undotree",
	enabled = not vim.g.vscode,
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, mode = "n", noremap = true, silent = true },
	},
}
