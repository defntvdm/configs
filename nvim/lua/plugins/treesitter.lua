vim.keymap.set("n", "<leader>tc", "<CMD>TSContextToggle<CR>", { silent = true, noremap = true, desc = "Toggle TS context" })
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
	},
	event = "VeryLazy",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"dockerfile",
			"go",
			"gomod",
			"javascript",
			"json",
			"lua",
			"make",
			"python",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vue",
			"yaml",
		},
		sync_install = false,
		highlight = {
			enable = true,
			disable = { "python" },
			additional_vim_regex_highlighting = true,
		},
		indent = {
			enable = true,
		},
	},
}
