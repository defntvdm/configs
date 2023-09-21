return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
	},
	lazy = true,
	build = ":TSUpdate",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
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
