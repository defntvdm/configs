require("nvim-treesitter.configs").setup({
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

	sync_install = true,

	highlight = {
		enable = true,
		disable = { "python" },
		additional_vim_regex_highlighting = true,
	},
})
