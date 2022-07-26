local null_ls = require'null-ls';

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local sources = {
    -- c/cpp
    formatting.clang_format,
    -- go
    formatting.goimports,
    -- python
    formatting.isort,
    formatting.black.with({
        extra_args = {
            '-l120',
            '-S',
        },
    }),
    -- django
    formatting.djhtml,
    -- html, css, js
    diagnostics.tidy,
    formatting.prettier.with({
        extra_args = {
            '--single-quote',
            '--jsx-single-quote',
            '--tab-width=2',
            '--end-of-line=lf',
            '--trailing-comma=all',
            '--print-width=120',
        },
    }),
    -- rust
    formatting.rustfmt,
};

null_ls.setup({
    sources = sources,
})
