local lsp = require("lspconfig")

local pythonPath = "/Users/defntvdm/.pyenv/versions/<VERSION>/bin/python"

lsp.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			pythonPath = pythonPath,
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

local dap = require("dap")

dap.adapters.custom_adapter = {
	type = "server",
	id = "debugpy",
	port = "${port}",
	executable = {
		command = pythonPath,
		args = { "-m", "debugpy", "--listen", "${port}", "--wait-for-client", "manage.py", "runserver" },
	},
}

dap.configurations.python = {
	{
		type = "custom_adapter",
		request = "attach",
		name = "Django",
		-- program = vim.fn.getcwd() .. "/manage.py",
		-- args = { "runserver" },
	},
}
