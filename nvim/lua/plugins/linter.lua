return {
	"mfussenegger/nvim-lint",
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		require("lint").linters_by_ft = {
			go = { "golangcilint" },
			html = { "tidy" },
			htmldjango = { "djlint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
			proto = { "buf_lint" },
			python = { "flake8", "mypy" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}
	end,
}
