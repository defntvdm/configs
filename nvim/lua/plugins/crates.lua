return {
	"saecki/crates.nvim",
	enabled = not vim.g.vscode,
	tag = "stable",
	event = { "BufRead Cargo.toml", "BufNewFile Cargo.toml" },
	lazy = true,
	config = function(_, opts)
		local crates = require("crates")
		crates.setup(opts)

		local function set_keymaps(bufnr)
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = bufnr,
					noremap = true,
					silent = true,
					desc = desc,
				})
			end

			map("n", "<leader>ct", crates.toggle, "Crates Toggle")
			map("n", "<leader>cr", crates.reload, "Crates Reload")
			map("n", "<leader>cf", crates.show_features_popup, "Crates Features")
			map("n", "<leader>cu", crates.update_crate, "Crate Update")
			map("v", "<leader>cu", crates.update_crates, "Crates Update")
			map("n", "<leader>cU", crates.upgrade_crate, "Crate Upgrade")
			map("v", "<leader>cU", crates.upgrade_crates, "Crates Upgrade")
		end

		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("defntvdm_crates", { clear = true }),
			pattern = "Cargo.toml",
			callback = function(ev)
				set_keymaps(ev.buf)
			end,
		})
		set_keymaps(0)
	end,
	opts = {},
}
