vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "Cargo.toml" },
	callback = function()
		vim.print("kokoko")
		vim.keymap.set("n", "<leader>ct", require("crates").toggle, { noremap = true, silent = true, desc = "Crates Toggle" })
		vim.keymap.set("n", "<leader>cr", require("crates").reload, { noremap = true, silent = true, desc = "Crates Reload" })
		vim.keymap.set("n", "<leader>cf", require("crates").show_features_popup, { noremap = true, silent = true, desc = "Crates Features" })

		vim.keymap.set("n", "<leader>cu", require("crates").update_crate, { noremap = true, silent = true, desc = "Crate Update" })
		vim.keymap.set("v", "<leader>cu", require("crates").update_crates, { noremap = true, silent = true, desc = "Crates Update" })
		vim.keymap.set("n", "<leader>cU", require("crates").upgrade_crate, { noremap = true, silent = true, desc = "Crate Upgrade" })
		vim.keymap.set("v", "<leader>cU", require("crates").upgrade_crates, { noremap = true, silent = true, desc = "Crates Upgrade" })
	end,
})
return {
	"saecki/crates.nvim",
	enabled = not vim.g.vscode,
	tag = "v0.3.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufEnter Cargo.toml",
	lazy = true,
	config = function(_, opts)
		require("crates").setup(opts)
	end,
	opts = {},
}
