local function lint_file()
	require("lint").try_lint()
end

return {
	"mfussenegger/nvim-lint",
	keys = {
		{ "<leader>l", lint_file, desc = "Trigger linting for current file" },
	},
	ft = defntvdm_filetypes,
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = {},
			cmake = { "cmakelint" },
			cpp = {},
			css = { { "eslint_d", "eslint" } },
			go = { "golangcilint" },
			html = { { "eslint_d", "eslint" } },
			javascript = { { "esling_d", "eslint" } },
			javascriptreact = { { "esling_d", "eslint" } },
			json = { "jsonlint" },
			less = { { "esling_d", "eslint" } },
			markdown = { "markdownlint" },
			php = { "php" },
			proto = { "buf_lint" },
			python = { "ruff" },
			typescript = { { "esling_d", "eslint" } },
			typescriptreact = { { "esling_d", "eslint" } },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
