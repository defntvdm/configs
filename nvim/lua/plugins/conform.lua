local function format()
	require("conform").format({
		timeout_ms = 5000,
		lsp_fallback = true,
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
			css = { { "prettierd", "prettier" } },
			go = { "goimports", "gofumpt" },
			html = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			less = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			markdown = { { "prettierd", "prettier" }, "mdformat" },
			php = { "phpcbf" },
			proto = { "buf" },
			python = { "darker" },
			rust = { "rustfmt" },
			sql = { "sqlfmt" },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			vue = {},
			xml = { "xmlformat" },
			yaml = { { "prettierd", "prettier" } },
			["_"] = { "trim_whitespace", "trim_newlines" },
		},
		formatters = {
			darker = {
				args = { "-l", "120", "-S", "-i", "-f", "-d", "--stdin-filename", "$FILENAME" },
				stdin = true,
			},
		},
		notify_on_error = true,
	},
}
