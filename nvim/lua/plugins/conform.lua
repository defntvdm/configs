local function format()
	require("conform").format({
		lsp_fallback = true,
		callback = function()
			print("Formatted")
		end,
	})
end

return {
	"stevearc/conform.nvim",
	keys = {
		{
			" f",
			format,
			desc = "Find file",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { { "prettierd", "prettier" } },
			go = { "goimports", "gofumpt" },
			html = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			less = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			proto = { "buf" },
			python = { "isort", "black" },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			xml = { "xmlformat" },
			yaml = { { "prettierd", "prettier" } },
			markdown = {},
			php = { "phpcbf" },
			rust = { "rustfmt" },
			vue = {},
			sql = { "sqlfmt" },
			["_"] = { "trim_whitespace", "trim_newlines" },
		},
	},
}
