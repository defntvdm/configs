local null_ls = require("null-ls")

local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
    -- formatting
    formatting.isort,
    formatting.black.with({
        extra_args = {
            "-S",
            "-l120",
            "--fast",
        },
    }),
    formatting.djlint,
    formatting.rustfmt,
    formatting.goimports,
    formatting.gofumpt,
    formatting.clang_format,
    formatting.prettier.with({
        extra_args = {
            "--single-quote",
            "--jsx-single-quote",
            "--tab-width=2",
            "--end-of-line=lf",
            "--trailing-comma=all",
            "--print-width=120",
        },
    }),
    formatting.stylua,
    formatting.buf,
    -- diagnostics
    diagnostics.flake8,
    diagnostics.golangci_lint,
    diagnostics.eslint_d,
    -- code_actions
    code_actions.eslint_d,
    code_actions.gomodifytags,
    code_actions.impl,
}

null_ls.setup({
    sources = sources,
})
