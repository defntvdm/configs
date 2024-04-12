return {
	"stevearc/dressing.nvim",
	event = "LspAttach",
	opts = {
		input = {
			enabled = true,
			default_prompt = "Input:",
			title_pos = "left",
			insert_only = true,
			start_in_insert = true,
			border = "rounded",
			relative = "cursor",
			prefer_width = 40,
			width = nil,
			max_width = { 140, 0.9 },
			min_width = { 20, 0.2 },
			buf_options = {},
			win_options = {
				winblend = 10,
				wrap = false,
				list = true,
				listchars = "precedes:…,extends:…",
				sidescrolloff = 0,
			},

			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<Up>"] = "HistoryPrev",
					["<Down>"] = "HistoryNext",
				},
			},

			override = function(conf)
				return conf
			end,

			get_config = nil,
		},
		select = {
			enabled = true,
			backend = { "telescope", "builtin" },

			trim_prompt = true,

			telescope = nil,

			builtin = {
				border = "rounded",
				relative = "editor",

				buf_options = {},
				win_options = {
					winblend = 10,
					cursorline = true,
					cursorlineopt = "both",
				},

				width = nil,
				max_width = { 140, 0.8 },
				min_width = { 40, 0.2 },
				height = nil,
				max_height = 0.9,
				min_height = { 10, 0.2 },

				mappings = {
					["<Esc>"] = "Close",
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
				},

				override = function(conf)
					return conf
				end,
			},

			format_item_override = {},

			get_config = nil,
		},
	},
}
