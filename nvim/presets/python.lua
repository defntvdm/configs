local lsp = require("lspconfig")

lsp.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			pythonPath = "/Users/defntvdm/.pyenv/versions/<VERSION>/bin/python",
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})
