local neotest = require("neotest")

neotest.setup({
    quickfix = {
        open = false,
    },
    status = {
        enabled = true,
        signs = true,
        virtual_text = false,
    },
    icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "✘",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "✓",
        running = "",
        running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        skipped = "↓",
        unknown = "",
    },
    floating = {
        border = "rounded",
        max_height = 0.9,
        max_width = 0.9,
        options = {},
    },
    summary = {
        open = "botright vsplit | vertical resize 60",
    },
    adapters = {
        require("neotest-python"),
        require("neotest-go"),
        require("neotest-rust"),
    },
})

local map_opts = { noremap = true, silent = true, nowait = true }
vim.keymap.set("n", " tfr", function()
    neotest.run.run(vim.fn.expand("%"))
    neotest.summary.open()
end, map_opts)

vim.keymap.set("n", " tr", function()
    neotest.run.run()
    neotest.summary.open()
end, map_opts)

vim.keymap.set("n", " to", neotest.output.open, map_opts)

vim.keymap.set("n", " tt", function()
    neotest.summary.toggle()
end, map_opts)
