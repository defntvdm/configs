return {
	"iamcco/markdown-preview.nvim",
	enabled = not vim.g.vscode,
	build = "cd app && npm install",
	keys = {
		{ "<leader>mm", "<cmd>MarkdownPreview<CR>", noremap = true, silent = true },
	},
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
