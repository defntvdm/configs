require("lspconfig")

local pythonPath = "/Users/defntvdm/.pyenv/versions/<VERSION>/bin/python"

vim.lsp.config("basedpyright", {
	settings = {
		python = {
			pythonPath = pythonPath,
		},
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				ignore = { "*" },
				typeCheckingMode = "off",
			},
		},
	},
})

local dap = require("dap")

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		local port = (config.connect or config).port
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = pythonPath,
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end

dap.adapters.django = {
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
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = pythonPath,
	},
	{
		type = "django",
		request = "attach",
		name = "Django",
		-- program = vim.fn.getcwd() .. "/manage.py",
		-- args = { "runserver" },
	},
}
