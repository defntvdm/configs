local crates = require("crates")

crates.setup({
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
vim.keymap.set("n", "<leader>cr", crates.reload, opts)
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)

vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
