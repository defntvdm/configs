local group = vim.api.nvim_create_augroup("crates_defntvdm", { clear = true })

local opts = { noremap = true, silent = true }

local events = {
	BufEnter = {
		{
			pattern = { "telekasten", "markdown" },
			callback = function()
				vim.keymap.set("n", "<leader>ct", require("crates").toggle, opts)
				vim.keymap.set("n", "<leader>cr", require("crates").reload, opts)
				vim.keymap.set("n", "<leader>cf", require("crates").show_features_popup, opts)

				vim.keymap.set("n", "<leader>cu", require("crates").update_crate, opts)
				vim.keymap.set("v", "<leader>cu", require("crates").update_crates, opts)
				vim.keymap.set("n", "<leader>cU", require("crates").upgrade_crate, opts)
				vim.keymap.set("v", "<leader>cU", require("crates").upgrade_crates, opts)
			end,
			group = group,
		},
	},
}

for event, opts in pairs(events) do
	for _, opt in pairs(opts) do
		vim.api.nvim_create_autocmd(event, opt)
	end
end

return {
	"saecki/crates.nvim",
	tag = "v0.3.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufEnter Cargo.toml",
	lazy = true,
	opts = {
		null_ls = {
			enabled = true,
			name = "crates.nvim",
		},
	},
}
