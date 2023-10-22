local lsp = require("lspconfig")

lsp.tsserver.setup({
	enabled = false,
})

lsp.volar.setup({
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})
