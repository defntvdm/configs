return {
	"saecki/crates.nvim",
	tag = "v0.3.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufEnter Cargo.toml",
	lazy = true,
	config = function(_, opts)
		require("crates").setup(opts)
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "Cargo.toml" },
			callback = function()
				local mapopts = { noremap = true, silent = true }
				vim.keymap.set("n", "<leader>ct", require("crates").toggle, mapopts)
				vim.keymap.set("n", "<leader>cr", require("crates").reload, mapopts)
				vim.keymap.set("n", "<leader>cf", require("crates").show_features_popup, mapopts)

				vim.keymap.set("n", "<leader>cu", require("crates").update_crate, mapopts)
				vim.keymap.set("v", "<leader>cu", require("crates").update_crates, mapopts)
				vim.keymap.set("n", "<leader>cU", require("crates").upgrade_crate, mapopts)
				vim.keymap.set("v", "<leader>cU", require("crates").upgrade_crates, mapopts)
			end,
		})
	end,
	opts = {},
}
