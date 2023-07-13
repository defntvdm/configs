local function run_file_tests()
	require("neotest").run.run(vim.fn.expand("%"))
	require("neotest").summary.open()
end

local function run_tests()
	require("neotest").run.run()
	require("neotest").summary.open()
end

local function show_output()
	require("neotest").output.open()
end

local function toggle()
	require("neotest").summary.toggle()
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
	},
	keys = {
		{ " tfr", run_file_tests, noremap = true, silent = true, nowait = true },
		{ " tr", run_tests, noremap = true, silent = true, nowait = true },
		{ " to", show_output, noremap = true, silent = true, nowait = true },
		{ " tt", toggle, noremap = true, silent = true, nowait = true },
	},
	config = function()
		require("neotest").setup({
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
	end,
}
