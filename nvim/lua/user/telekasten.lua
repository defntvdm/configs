local vaults = {
    life = "/Users/defntvdm/Yandex.Disk.localized/Obsidian/LIFE",
    work = "/Users/defntvdm/Yandex.Disk.localized/Obsidian/WORK",
}

local telekasten = require("telekasten")

local config = {
    default_vault = "work",
    vaults = {},
}

for name, home in pairs(vaults) do
    config.vaults[name] = {
        home = home,
        take_over_my_home = true,
        auto_set_filetype = true,
        auto_set_syntax = true,
        dailies = home .. "/daily",
        weeklies = home .. "/weekly",
        templates = home .. "/templates",
        image_subdir = home .. "/images",
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

telekasten.setup(config)

local group = vim.api.nvim_create_augroup("telekasten_defntvdm", { clear = true })

local events = {
    FileType = {
        {
            pattern = { "telekasten", "markdown" },
            callback = function()
                vim.keymap.set("n", "gd", telekasten.follow_link)
                vim.keymap.set("n", "gr", telekasten.show_backlinks)
                vim.keymap.set("n", " d", telekasten.toggle_todo)
                vim.keymap.set("n", " c", telekasten.show_calendar)
                vim.keymap.set("n", " y", telekasten.yank_notelink)
            end,
            group = group,
        },
    },
}

for event, opts in pairs(events) do
    for _, opt in pairs(opts) do
        vim.api.nvim_create_autocmd(event, opt)
    end
end
