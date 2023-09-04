return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	config = function(_, opts)
		require("telescope") -- init ui-select
		require("mason").setup(opts)
	end,
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
