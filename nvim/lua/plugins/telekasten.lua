local vaults = {
	life = "/Users/defntvdm/Yandex.Disk.localized/Obsidian/LIFE",
	work = "/Users/defntvdm/Yandex.Disk.localized/Obsidian/WORK",
}

local config = {
	default_vault = "work",
	vaults = {},
}

for name, home in pairs(vaults) do
	config.vaults[name] = {
		home = home,
		take_over_my_home = true,
		auto_set_filetype = false,
		auto_set_syntax = true,
		dailies = home .. "/daily",
		weeklies = home .. "/weekly",
		templates = home .. "/templates",
		image_subdir = home .. "/media",
		extension = ".md",
		new_note_filename = "title-uuid",
		uuid_type = "%Y%m%d%H%M",
		uuid_sep = "-",
		filename_space_subst = nil,
		follow_creates_nonexisting = true,
		dailies_create_nonexisting = true,
		weeklies_create_nonexisting = true,
		journal_auto_open = false,
		template_new_note = home .. "/templates/new.md",
		template_new_daily = home .. "/templates/daily.md",
		template_new_weekly = home .. "/templates/weekly.md",
		image_link_style = "markdown",
		sort = "filename",
		subdirs_in_links = true,
		plug_into_calendar = true,
		calendar_opts = {
			weeknm = 4,
			calendar_monday = 1,
			-- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
			calendar_mark = "left-fit",
		},
		close_after_yanking = false,
		insert_after_inserting = true,
		tag_notation = "#tag",
		-- command palette theme: dropdown (window) or ivy (bottom panel)
		command_palette_theme = "dropdown",
		show_tags_theme = "dropdown",
		template_handling = "smart",
		new_note_location = "smart",
		rename_update_links = true,
		media_previewer = "viu-previewer",
		follow_url_fallback = nil,
	}
end

local os = require("os")
local time_fmt = "%Y-%m-%d %H:%M:%S"
local time_fmt_pattern = "START_TIME: (%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"

local function next_state()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
	if line:match("- %[") == nil or line:match("DONE_TIME") ~= nil then
		return
	end
	if line:match("START_TIME") == nil then
		line = line .. " START_TIME: " .. os.date(time_fmt)
		vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line })
		return
	end
	local year, month, day, hour, min, sec = line:match(time_fmt_pattern)
	local ts_struct = { year = year, month = month, day = day, hour = hour, min = min, sec = sec }
	local start_ts = os.time(ts_struct)
	local elapsed = os.time() - start_ts
	line = line .. " DONE_TIME: " .. os.date(time_fmt) .. " ELAPSED: "
	if math.floor(elapsed / 3600) ~= 0 then
		line = line .. math.floor(elapsed / 3600) .. "h"
		elapsed = elapsed % 3600
	end
	if math.floor(elapsed / 60) ~= 0 then
		line = line .. math.floor(elapsed / 60) .. "m"
		elapsed = elapsed % 60
	end
	line = line .. elapsed .. "s"
	vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line })
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.keymap.set("n", "gF", require("telekasten").follow_link, { buffer = 0 })
		vim.keymap.set("n", "gr", require("telekasten").show_backlinks, { buffer = 0 })
		vim.keymap.set("n", " d", require("telekasten").toggle_todo, { buffer = 0 })
		vim.keymap.set("n", " c", require("telekasten").show_calendar, { buffer = 0 })
		vim.keymap.set("n", " y", require("telekasten").yank_notelink, { buffer = 0 })
		vim.keymap.set("n", " s", next_state, { buffer = 0 })
	end,
	group = vim.api.nvim_create_augroup("telekasten_defntvdm", { clear = true }),
})

local function goto_today()
	require("telekasten").goto_today()
end

local function switch_vault()
	require("telekasten").switch_vault()
end

return {
	"renerocksai/telekasten.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"renerocksai/calendar-vim",
	},
	keys = {
		{ "<leader>tt", goto_today, noremap = true, silent = true },
		{ "<leader>tv", switch_vault, noremap = true, silent = true },
	},
	opts = config,
}
