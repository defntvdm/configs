local function format_async()
	vim.lsp.buf.format({ async = true })
end

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
		"williamboman/mason.nvim",
	},
	event = "LspAttach",
	lazy = true,
	ft = {
		"cpp",
		"css",
		"go",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"lua",
		"markdown",
		"php",
		"python",
		"rust",
		"typescript",
		"typescriptreact",
		"vue",
		"xml",
		"yaml",
	},
	keys = {
		{ " f", format_async, mode = { "v", "n" }, noremap = true, silent = true, desc = "Formatting" },
	},
	config = function(_, opts)
		require("mason-null-ls").setup({
			automatic_installation = true,
		})
		require("null-ls").setup(opts)
	end,
	opts = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		local sources = {
			-- formatting
			formatting.isort,
			formatting.black.with({
				extra_args = {
					"-S",
					"-l150",
					"--fast",
				},
			}),
			formatting.djlint,
			formatting.rustfmt,
			formatting.goimports,
			formatting.gofumpt,
			formatting.clang_format,
			formatting.prettier.with({
				filetypes = {
					"css",
					"graphql",
					"handlebars",
					"html",
					"javascript",
					"javascriptreact",
					"jsonc",
					"less",
					"markdown",
					"markdown.mdx",
					"scss",
					"typescript",
					"typescriptreact",
					"vue",
                    "xml",
					"yaml",
				},
				extra_args = {
					"--single-quote",
					"--jsx-single-quote",
					"--tab-width=2",
					"--end-of-line=lf",
					"--trailing-comma=all",
					"--print-width=150",
				},
			}),
			formatting.prettier.with({
				filetypes = {
					"json",
				},
				extra_args = {
					"--single-quote",
					"--jsx-single-quote",
					"--tab-width=4",
					"--end-of-line=lf",
					"--trailing-comma=all",
					"--print-width=150",
				},
			}),
			formatting.stylua,
			formatting.buf,
			formatting.phpcbf,
            formatting.xmlformat,
			-- diagnostics
			diagnostics.flake8,
			diagnostics.golangci_lint,
			diagnostics.eslint_d,
			-- code_actions
			code_actions.eslint_d,
			code_actions.gomodifytags,
			code_actions.impl,
		}
		return { sources = sources }
	end,
}
