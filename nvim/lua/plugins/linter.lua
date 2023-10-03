return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
	},
	ft = {
		"c",
		"cpp",
		"css",
		"go",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"lua",
		"python",
		"rust",
		"typescript",
		"typescriptreact",
		"vue",
		"yaml",
        "markdown",
	},
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		local lint = require("lint")
		local linters = lint.linters
		linters.flake8.args = {
			"--max-line-length",
			"149",
			"--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
			"--no-show-source",
			"-",
		}
		lint.linters_by_ft = {
			go = { "golangcilint" },
			html = { "tidy" },
			htmldjango = { "djlint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
			proto = { "buf_lint" },
			python = { "flake8" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}
	end,
}
