return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>ff", ":SnacksFiles ./", noremap = true, desc = "Find files in subdir" },
		{
			"<leader>fd",
			function()
				Snacks.picker.files()
			end,
			mode = "n",
			noremap = true,
			desc = "Find files",
			silent = true,
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			noremap = true,
			mode = "n",
			silent = true,
			desc = "Find vim help",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			mode = "n",
			noremap = true,
			desc = "Find buffers",
			silent = true,
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			mode = "n",
			noremap = true,
			desc = "Find marks",
			silent = true,
		},
		{ "<leader>fg", ":SnacksGrep ./", noremap = true, desc = "Live grep" },
		{ "<leader>fv", ":SnacksGrepWord ./", noremap = true, desc = "Live grep word" },
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			mode = "n",
			noremap = true,
			desc = "Resume picker",
			silent = true,
		},
		{
			"<leader>fz",
			function()
				Snacks.picker.lines()
			end,
			mode = "n",
			noremap = true,
			desc = "Grep in current file",
			silent = true,
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.lsp_symbols()
			end,
			noremap = true,
			desc = "LSP symbols in current file",
			mode = "n",
			silent = true,
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			noremap = true,
			desc = "LSP symbols in workspace",
			mode = "n",
			silent = true,
		},
		{
			"<leader>jl",
			function()
				Snacks.picker.jumps()
			end,
			noremap = true,
			desc = "Jumplist",
			mode = "n",
			silent = true,
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.registers()
			end,
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Clipboard",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			mode = "n",
			noremap = true,
			silent = true,
			desc = "QuckFix",
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		vim.api.nvim_create_user_command("SnacksIcons", function()
			Snacks.picker.icons()
		end, {})
		vim.api.nvim_create_user_command("SnacksFiles", function(args)
			Snacks.picker.files({ cwd = args.args })
		end, { nargs = "+" })
		vim.api.nvim_create_user_command("SnacksGrep", function(args)
			Snacks.picker.grep({ cwd = args.args })
		end, { nargs = "+" })
		vim.api.nvim_create_user_command("SnacksGrepWord", function(args)
			Snacks.picker.grep_word({ cwd = args.args })
		end, { nargs = "+" })
	end,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
      _       __       _            _           
     | |     / _|     | |          | |          
   __| | ___| |_ _ __ | |___   ____| |_ __ ___  
  / _` |/ _ \  _| '_ \| __\ \ / / _` | '_ ` _ \ 
 | (_| |  __/ | | | | | |_ \ V / (_| | | | | | |
  \__,_|\___|_| |_| |_|\__| \_/ \__,_|_| |_| |_|
]],
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = ":SnacksFiles ./",
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":SnacksGrep ./",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = function()
							Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						end,
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					{
						icon = " ",
						key = "p",
						desc = "Projects",
						action = function()
							Snacks.picker.projects({
								dev = { "~/", "~/project", "~/projects" },
								patterns = { ".git", ".nvim.lua" },
								confirm = {
									"cd",
									function()
										pcall(vim.cmd.source, ".nvim.lua")
									end,
									"close",
								},
							})
						end,
					},
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, top_down = false },
		quickfile = { enabled = true },
		picker = { ui_select = true, layout = { preset = "telescope" } },
		rename = { enabled = true },
		terminal = { enabled = true },
		words = { enabled = true },
	},
}
