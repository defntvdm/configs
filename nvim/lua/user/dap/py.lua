local dap = require("dap")

-- pip install debugpy

dap.adapters.python = {
	type = "executable",
	command = "/Users/defntvdm/.local/share/nvim/mason/bin/debugpy",
	args = {},
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",

		program = "${file}",
		pythonPath = "/Users/defntvdm/.pyenv/shims/python3",
	},
}
