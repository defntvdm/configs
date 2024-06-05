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
			css = { "eslint_d" },
			go = { "golangcilint" },
			html = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			less = { "eslint_d" },
			markdown = { "markdownlint" },
			php = { "php" },
			proto = { "buf_lint" },
			python = { "ruff" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
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
