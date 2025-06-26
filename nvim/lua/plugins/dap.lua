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

local function setup_go(dap)
	dap.adapters.delve = {
		type = "server",
		port = "${port}",
		executable = {
			command = "dlv",
			args = { "dap", "-l", "127.0.0.1:${port}" },
		},
	}

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

local function setup_python(dap)
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
				command = "python",
				args = { "-m", "debugpy.adapter" },
				options = {
					source_filetype = "python",
				},
			})
		end
	end

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = "python",
		},
	}
end

local function set_signs(dap)
	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
	)
	vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })
	dap.defaults.fallback.force_external_terminal = true
end

local function setup_ui(dap)
	local dapui = require("dapui")
	dapui.setup({
		layouts = {
			{
				elements = {
					"stacks",
					{ id = "scopes", size = 0.5 },
					{ id = "breakpoints", size = 0.15 },
				},
				size = 0.33,
				position = "left",
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					"console",
				},
				size = 0.25,
				position = "bottom",
			},
		},
		controls = {
			-- Requires Neovim nightly (or 0.8 when released)
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				pause = "",
				play = "",
				step_into = "",
				step_over = "",
				step_out = "",
				step_back = "",
				run_last = "↻",
				terminate = "□",
			},
		},
	})
	vim.keymap.set("n", "<F12>", dapui.toggle, { noremap = true, silent = true })
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return {
	"mfussenegger/nvim-dap",
	enabled = not vim.g.vscode,
	dependencies = {
		{ "rcarriga/nvim-dap-ui", tag = "v4.0.0", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	},
	keys = {
		{
			"<F5>",
			continue,
			desc = "Continue DAP",
		},
		{
			"<F9>",
			toggle_breakpoint,
			desc = "Toggle breakpoint",
		},
		{
			"<F10>",
			step_over,
			desc = "Step into DAP",
		},
		{
			"<F11>",
			step_into,
			desc = "Step over DAP",
		},
	},
	config = function()
		local dap = require("dap")
		set_signs(dap)
		setup_go(dap)
		setup_python(dap)
		setup_ui(dap)
	end,
}
