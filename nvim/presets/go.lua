require("lspconfig")

local project = "<LOCAL_HERE>"

vim.lsp.config("gopls", {
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			["local"] = project,
		},
	},
})
