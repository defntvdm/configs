local lsp = require("lspconfig")

lsp.clangd.setup({
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
		"--offset-encoding=utf-16",
		"--completion-style=detailed",
		"--log=error",
		"-j=8",
		"--compile-commands-dir=<INSERT_PATH_HERE>",
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})
