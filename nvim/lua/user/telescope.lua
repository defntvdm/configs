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

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", ":Telescope fd cwd=./", { noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep cwd=./", { noremap = true })
vim.keymap.set("n", "<leader>fig", ":Telescope grep_string cwd=./", { noremap = true })
vim.keymap.set("n", "<leader>ft", builtin.lsp_document_symbols, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { noremap = true, silent = true })

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("goimpl")
telescope.load_extension("harpoon")
