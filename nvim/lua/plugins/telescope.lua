local function buffers(opts)
	local themes = require("telescope.themes")
	require("telescope.builtin").buffers(themes.get_ivy(opts))
end

local function lsp_symbols(opts)
	local themes = require("telescope.themes")
	require("telescope.builtin").lsp_document_symbols(themes.get_ivy(opts))
end

local function fzf_find(opts)
	local themes = require("telescope.themes")
	require("telescope.builtin").current_buffer_fuzzy_find(themes.get_ivy(opts))
end

local function tasks(_)
	require("telescope").extensions.tasks.tasks()
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-symbols.nvim",
		"edolphin-ydf/goimpl.nvim",
		"ThePrimeagen/harpoon",
		"nvim-treesitter/nvim-treesitter",
		"lpoto/telescope-tasks.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", ":Telescope fd theme=ivy cwd=./", noremap = true, desc = "Find files" },
		{ "<leader>fb", buffers, noremap = true, silent = true, desc = "Find buffers" },
		{ "<leader>fg", ":Telescope live_grep theme=ivy cwd=./", noremap = true, desc = "Live grep" },
		{ "<leader>fig", ":Telescope grep_string theme=ivy cwd=./", noremap = true, desc = "Grep" },
		{ "<leader>fc", ":Telescope neoclip theme=ivy<CR>", noremap = true, desc = "Clipboard" },
		{ "<leader>fz", fzf_find, noremap = true, silent = true, desc = "Grep in current file" },
		{ "<leader>ft", lsp_symbols, noremap = true, silent = true, desc = "LSP symbols in current file" },
		{ "<leader>fs", tasks, noremap = true, silent = true, desc = "Tasks" },
		{ "<leader>jl", "<cmd>Telescope jumplist theme=ivy<CR>", noremap = true, silent = true, desc = "Jumplist" },
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("goimpl")
		telescope.load_extension("harpoon")
		telescope.load_extension("neoclip")
		telescope.load_extension("tasks")
		telescope.load_extension("vim_bookmarks")
		-- require("telescope-tasks.generators").default.all()
		telescope.load_extension("arc")
	end,
	opts = {
		defaults = {
			prompt_prefix = " ",
			theme = "ivy",
			path_display = { "smart" },
			file_ignore_patterns = {
				".git/",
				"node_modules/*",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			tasks = {
				theme = "ivy",
				output = {
					style = "float", -- "split" | "float" | "tab"
					layout = "center", -- "left" | "right" | "center" | "below" | "above"
					scale = 0.4,
				},
			},
		},
	},
}
