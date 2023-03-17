local telescope = require("telescope")

telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {},
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("goimpl")
