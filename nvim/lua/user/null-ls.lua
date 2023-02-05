local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	-- formatting
	formatting.isort,
	formatting.black,
	formatting.djlint,
	formatting.rustfmt,
	formatting.goimports,
	formatting.gofumpt,
	formatting.clang_format,
	formatting.prettierd,
	formatting.stylua,
	formatting.buf,
	-- diagnostics
	diagnostics.flake8,
	diagnostics.mypy,
	diagnostics.ruff,
	diagnostics.pylint,
	diagnostics.golangci_lint,
	diagnostics.staticcheck,
	diagnostics.revive,
	diagnostics.cpplint,
	diagnostics.eslint_d,
	-- code_actions
	code_actions.eslint_d,
	code_actions.gitsigns,
	code_actions.gomodifytags,
	code_actions.ltrs,
}

null_ls.setup({
	sources = sources,
})
