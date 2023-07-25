local function buffers()
	require("telescope.builtin").buffers()
end

local function lsp_symbols()
	require("telescope.builtin").lsp_document_symbols()
end

local function fzf_find()
	require("telescope.builtin").current_buffer_fuzzy_find()
end

local function undo()
	require("telescope").extensions.undo.undo()
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"edolphin-ydf/goimpl.nvim",
		"ThePrimeagen/harpoon",
		"nvim-treesitter/nvim-treesitter",
		"debugloop/telescope-undo.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", ":Telescope fd cwd=./", noremap = true },
		{ "<leader>fb", buffers, noremap = true, silent = true },
		{ "<leader>fg", ":Telescope live_grep cwd=./", noremap = true },
		{ "<leader>fig", ":Telescope grep_string cwd=./", noremap = true },
		{ "<leader>ft", lsp_symbols, noremap = true, silent = true },
		{ "<leader>fz", fzf_find, noremap = true, silent = true },
		{ "<leader>u", undo, noremap = true, silent = true },
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("goimpl")
		telescope.load_extension("harpoon")
		telescope.load_extension("undo")
	end,
	opts = {
		extensions = {
			undo = {},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {},
		},
	},
}
