return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	keys = {
		{ "<leader>mm", "<cmd>MarkdownPreview<CR>", noremap = true, silent = true },
	},
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
