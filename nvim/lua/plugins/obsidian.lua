return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	enabled = false,
	event = "VeryLazy",
	cmd = {
		"Obsidian",
	},
	keys = {
		{
			" on",
			":Obsidian new notes/",
			desc = "Create new note",
		},
		{
			" ot",
			"<cmd>Obsidian today<cr>",
			desc = "Go to today note",
		},
		{
			" os",
			"<cmd>Obsidian search<cr>",
			desc = "Search note",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		legacy_commands = false,
		ui = {
			enable = false,
			checkboxes = {
				[" "] = { char = "☐", hl_group = "ObsidianTodo" },
				["x"] = { char = "✔", hl_group = "ObsidianDone" },
			},
		},
		workspaces = {
			{
				name = "personal",
				path = "~/yandex_disk/LIFE",
			},
			{
				name = "work",
				path = "~/yandex_disk/Yandex Team (NDA)/WORK",
			},
		},
		notes_subdir = "notes",
		attachments = {
			img_folder = "media",
		},
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily-notes" },
			template = "daily.md",
		},
		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
		},
		picker = {
			name = "snacks.pick",
		},
		new_notes_location = "notes_subdir",
		mappings = {
			["gd"] = {
				action = "<cmd>Obsidian follow_link<cr>",
				opts = { noremap = false, buffer = true, silent = true, desc = "Follow link" },
			},
			[" toc"] = {
				action = "<cmd>Obsidian toc<cr>",
				opts = { noremap = true, buffer = true, silent = true, desc = "Show table of content" },
			},
			[" d"] = {
				action = "<cmd>Obsidian toggle_checkbox<cr>",
				opts = { noremap = true, silent = true, buffer = true, desc = "Toggle checkbox" },
			},
			[" on"] = {
				action = ":Obsidian new notes/",
				opts = { noremap = true, desc = "Create new note" },
			},
			[" os"] = {
				action = "<cmd>Obsidian search<cr>",
				opts = { noremap = true, desc = "Search note" },
			},
		},
		note_id_func = function()
			return tostring(os.time())
		end,
		note_path_func = function(spec)
			local path = spec.dir / (spec.title .. "_" .. tostring(spec.id))
			return path:with_suffix(".md")
		end,
		link = {
			style = "wiki",
		},
	},
}
