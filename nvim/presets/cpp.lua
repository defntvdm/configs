require("lspconfig")
vim.lsp.config("clangd", {
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
})
