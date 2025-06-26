return {
	"mbbill/undotree",
	enabled = not vim.g.vscode,
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, "n", noremap = true, silent = true },
	},
}
