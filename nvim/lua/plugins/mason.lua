return {
	"williamboman/mason.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
	},
	cmd = "Mason",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			border = "rounded",
		},
	},
}
