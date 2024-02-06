local lspconfig = require("lspconfig")

local project = "<LOCAL_HERE>"

lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			["local"] = project,
		},
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})
