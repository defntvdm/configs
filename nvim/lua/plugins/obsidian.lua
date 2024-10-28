return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	cmd = {
		"ObsidianWorkspace",
	},
	keys = {
		{
			" on",
			":ObsidianNew notes/",
			desc = "Create new note",
		},
		{
			" ot",
			"<cmd>ObsidianToday<cr>",
			desc = "Go to today note",
		},
		{
			" os",
			"<cmd>ObsidianSearch<cr>",
			desc = "Search note",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
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
				path = "~/Yandex.Disk.localized/LIFE",
			},
			{
				name = "work",
				path = "~/Yandex.Disk.localized/Yandex Team (NDA)/WORK",
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
			nvim_cmp = true,
			min_chars = 2,
		},
		new_notes_location = "notes_subdir",
		mappings = {
			["gd"] = {
				action = "<cmd>ObsidianFollowLink<cr>",
				opts = { noremap = false, buffer = true, silent = true, desc = "Follow link" },
			},
			[" toc"] = {
				action = "<cmd>ObsidianTOC<cr>",
				opts = { noremap = true, buffer = true, silent = true, desc = "Show table of content" },
			},
			[" d"] = {
				action = "<cmd>ObsidianToggleCheckbox<cr>",
				opts = { noremap = true, silent = true, buffer = true, desc = "Toggle checkbox" },
			},
			[" on"] = {
				action = ":ObsidianNew notes/",
				opts = { noremap = true, desc = "Create new note" },
			},
			[" os"] = {
				action = "<cmd>ObsidianSearch<cr>",
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
		preferred_link_style = "wiki",
	},
}
