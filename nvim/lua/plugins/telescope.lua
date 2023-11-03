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

local function symbols(_)
	require("telescope.builtin").symbols({ sources = { "emoji", "gitmoji" } })
end

local function projects(_)
	require("telescope").extensions.project.project({})
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
		"nvim-telescope/telescope-project.nvim",
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
		{ "<leader>fv", symbols, noremap = true, silent = true, desc = "Symbols" },
		{ "<leader>jl", "<cmd>Telescope jumplist theme=ivy<CR>", noremap = true, silent = true, desc = "Jumplist" },
		{ "<leader>fp", projects, noremap = true, silent = true, desc = "Project" },
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("goimpl")
		telescope.load_extension("harpoon")
		telescope.load_extension("neoclip")
		telescope.load_extension("tasks")
		telescope.load_extension("project")
		require("telescope-tasks.generators").default.all()
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
					style = "float",
					layout = "center",
					scale = 0.4,
				},
			},
			project = {
				on_project_selected = function(prompt_bufnr)
					local project_actions = require("telescope._extensions.project.actions")
					project_actions.change_working_directory(prompt_bufnr, false)
					local local_vimrc = vim.fn.getcwd() .. "/.nvim.lua"
					if vim.loop.fs_stat(local_vimrc) then
						vim.cmd("source " .. local_vimrc)
					end
				end,
			},
		},
	},
}
