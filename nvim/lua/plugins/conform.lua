local function format()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	}, function(err)
		if err == nil then
			vim.notify("Formatted")
		else
			vim.notify("Formatter failed, see logs")
		end
	end)
end

return {
	"stevearc/conform.nvim",
	enabled = not vim.g.vscode,
	keys = {
		{
			" f",
			format,
			mode = { "n", "v" },
			desc = "Format",
		},
	},
	opts = {
		format_on_save = nil,
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { "prettier" },
			go = { "goimports", "gofumpt" },
			html = { "prettier" },
			htmldjango = { "djlint" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			less = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			php = { "phpcbf" },
			proto = { "buf" },
			python = { "ruff_fix", "isort", "black" },
			rust = { "rustfmt" },
			sql = { "sqlfmt" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			xml = { "xmlformat" },
			yaml = { "prettier" },
			["_"] = { "trim_whitespace", "trim_newlines" },
		},
		formatters = {
			darker = {
				args = { "-l", "120", "-S", "-i", "-f", "-d", "--stdin-filename", "$FILENAME" },
				stdin = true,
			},
			black = {
				prepend_args = { "-l", "120", "-S" },
				stdin = true,
			},
			prettier = {
				prepend_args = { "--jsx-single-quote", "--single-quote", "--line-width", "120" },
			},
		},
		notify_on_error = true,
	},
}
