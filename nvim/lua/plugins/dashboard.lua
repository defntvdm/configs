return {
	"nvimdev/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	opts = {
		theme = "doom",
		config = {
			header = {
				"",
				"",
				"      $$\\            $$$$$$\\             $$\\                    $$\\               ",
				"      $$ |          $$  __$$\\            $$ |                   $$ |              ",
				" $$$$$$$ | $$$$$$\\  $$ /  \\__|$$$$$$$\\ $$$$$$\\ $$\\    $$\\  $$$$$$$ |$$$$$$\\$$$$\\  ",
				"$$  __$$ |$$  __$$\\ $$$$\\     $$  __$$\\\\_$$  _|\\$$\\  $$  |$$  __$$ |$$  _$$  _$$\\ ",
				"$$ /  $$ |$$$$$$$$ |$$  _|    $$ |  $$ | $$ |   \\$$\\$$  / $$ /  $$ |$$ / $$ / $$ |",
				"$$ |  $$ |$$   ____|$$ |      $$ |  $$ | $$ |$$\\ \\$$$  /  $$ |  $$ |$$ | $$ | $$ |",
				"\\$$$$$$$ |\\$$$$$$$\\ $$ |      $$ |  $$ | \\$$$$  | \\$  /   \\$$$$$$$ |$$ | $$ | $$ |",
				" \\_______| \\_______|\\__|      \\__|  \\__|  \\____/   \\_/     \\_______|\\__| \\__| \\__|",
				"",
				"",
			},
			center = {
				{
					icon = "󰙅 ",
					icon_hl = "Title",
					desc = "Open project",
					desc_hl = "String",
					key = "p",
					key_hl = "Number",
					action = ":Telescope project",
				},
				{
					icon = " ",
					icon_hl = "Title",
					desc = "Find file",
					desc_hl = "String",
					key = "f",
					key_hl = "Number",
					action = function()
						local root = vim.fn.getcwd()
						local opts = { cwd = "./" }
						if root:match("arcadia") ~= nil then
							opts.cwd = "./weather"
						end
						local themes = require("telescope.themes")
						require("telescope.builtin").fd(themes.get_ivy(opts))
					end,
				},
				{
					icon = " ",
					icon_hl = "Title",
					desc = "New file",
					desc_hl = "String",
					key = "n",
					key_hl = "Number",
					action = ":ene",
				},
				{
					icon = "↯ ",
					icon_hl = "Title",
					desc = "Lazy",
					desc_hl = "String",
					key = "l",
					key_hl = "Number",
					action = ":Lazy",
				},
				{
					icon = "⏻ ",
					icon_hl = "Title",
					desc = "Quit Neovim",
					desc_hl = "String",
					key = "q",
					key_hl = "Number",
					action = ":qa!",
				},
			},
		},
	},
}
