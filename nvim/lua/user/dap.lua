local function toggle_breakpoint()
	require("dap").toggle_breakpoint()
end

local function continue()
	require("dap").continue()
end

local function step_over()
	require("dap").step_over()
end

local function step_into()
	require("dap").step_into()
end

local function repl_open()
	require("dap").repl.open()
end

local function toggle()
	require("dapui").toggle()
end

local function setup_dapui()
	local dap, dapui = require("dap"), require("dapui")

	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸" },
		mappings = {
			expand = { "<CR>", "l" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		expand_lines = vim.fn.has("nvim-0.7"),
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.25,
					},
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 00.25 },
				},
				size = 40,
				position = "left",
			},
			{
				elements = { "repl" },
				size = 10,
				position = "bottom",
			},
		},
		floating = {
			max_height = nil,
			max_width = nil,
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
		},
	})

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local function setup_go()
	local dap = require("dap")
	dap.adapters.delve = {
		type = "server",
		port = "${port}",
		executable = {
			command = "dlv",
			args = { "dap", "-l", "127.0.0.1:${port}" },
		},
	}

	-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
	dap.configurations.go = {
		{
			type = "delve",
			name = "Debug",
			request = "launch",
			program = "${file}",
		},
		{
			type = "delve",
			name = "Debug test", -- configuration for debugging test files
			request = "launch",
			mode = "test",
			program = "${file}",
		},
		-- works with go.mod packages and sub packages
		{
			type = "delve",
			name = "Debug test (go.mod)",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}",
		},
	}
end

local function setup_py()
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
end

local function setup_rust()
	local dap = require("dap")

	-- download https://github.com/vadimcn/vscode-lldb release and unpack to /Users/defntvdm/.dap-adapters/codelldb
	-- extension folder

	dap.adapters.codelldb = {
		type = "server",
		host = "127.0.0.1",
		port = 13000,
		executable = {
			command = "/Users/defntvdm/.local/share/nvim/mason/bin/codelldb",
			args = { "--port", "13000" },
			-- detached = false,
		},
	}

	dap.configurations.c = {
		{
			type = "codelldb",
			request = "launch",
			name = "Launch file",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
	}

	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{ "<F9>", toggle_breakpoint, noremap = true },
		{ "<F5>", continue, noremap = true },
		{ "<F10>", step_over, noremap = true },
		{ "<F11>", step_into, noremap = true },
		{ "<F12>", repl_open, noremap = true },
		{ "<leader>dq", toggle, noremap = true },
	},
	config = function()
		require("mason-nvim-dap").setup({
			automatic_installation = true,
		})

		setup_dapui()
		setup_go()
		setup_py()
		setup_rust()
	end,
}
