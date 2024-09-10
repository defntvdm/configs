local function format()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	}, function()
		vim.notify("Formatted")
	end)
end

return {
	"stevearc/conform.nvim",
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
			css = { "prettierd" },
			go = { "goimports", "gofumpt" },
			html = { "prettierd" },
			htmldjango = { "djlint" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			less = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			php = { "phpcbf" },
			proto = { "buf" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			sql = { "sqlfmt" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = {},
			xml = { "xmlformat" },
			yaml = { "prettierd" },
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
		},
		notify_on_error = true,
	},
}
