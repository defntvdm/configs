return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
      $$\            $$$$$$\             $$\                    $$\               
      $$ |          $$  __$$\            $$ |                   $$ |              
 $$$$$$$ | $$$$$$\  $$ /  \__|$$$$$$$\ $$$$$$\ $$\    $$\  $$$$$$$ |$$$$$$\$$$$\  
$$  __$$ |$$  __$$\ $$$$\     $$  __$$\\_$$  _|\$$\  $$  |$$  __$$ |$$  _$$  _$$\ 
$$ /  $$ |$$$$$$$$ |$$  _|    $$ |  $$ | $$ |   \$$\$$  / $$ /  $$ |$$ / $$ / $$ |
$$ |  $$ |$$   ____|$$ |      $$ |  $$ | $$ |$$\ \$$$  /  $$ |  $$ |$$ | $$ | $$ |
\$$$$$$$ |\$$$$$$$\ $$ |      $$ |  $$ | \$$$$  | \$  /   \$$$$$$$ |$$ | $$ | $$ |
 \_______| \_______|\__|      \__|  \__|  \____/   \_/     \_______|\__| \__| \__|]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "p", desc = "Projects", action = ":Telescope project" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, top_down = false },
		quickfile = { enabled = true },
		rename = { enabled = true },
		words = { enabled = true },
	},
}
