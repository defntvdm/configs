local function lint_file()
	require("lint").try_lint()
end

return {
	"mfussenegger/nvim-lint",
	enabled = not vim.g.vscode,
	keys = {
		{ "<leader>ll", lint_file, desc = "Trigger linting for current file" },
	},
	ft = defntvdm_filetypes,
	config = function()
		local lint = require("lint")

		lint.linters.golangcilint.args = {
			"run",
			"--output.json.path=stdout",
			"--issues-exit-code=0",
			"--show-stats=false",
			function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
			end,
		}

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
			proto = { "buf_lint" },
			python = { "mypy" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = lint_file,
		})
	end,
}
