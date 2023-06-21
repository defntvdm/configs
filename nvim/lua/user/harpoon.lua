require("harpoon").setup({})

local marks = require("harpoon.mark")
local ui = require("harpoon.ui")
local set_km = vim.keymap.set
local opts = { noremap = true, silent = true }

set_km("n", " a", marks.add_file, opts)
set_km("n", " m", ui.toggle_quick_menu, opts)
set_km("n", "<leader>p", ui.nav_prev, opts)
set_km("n", "<leader>n", ui.nav_next, opts)
