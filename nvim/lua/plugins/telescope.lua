local function marks(opts)
	require("telescope.builtin").marks(opts)
end

local function buffers(opts)
	require("telescope.builtin").buffers(opts)
end

local function lsp_symbols(opts)
	require("telescope.builtin").lsp_document_symbols(opts)
end

local function lsp_workspace_symbols(opts)
	require("telescope.builtin").lsp_workspace_symbols(opts)
end

local function fzf_find(opts)
	require("telescope.builtin").current_buffer_fuzzy_find(opts)
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

local function resume(_)
	require("telescope.builtin").resume({})
end

local function find_files()
	require("telescope.builtin").fd({ hidden = true })
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
		"Marskey/telescope-sg",
		"nvim-telescope/telescope-dap.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", ":Telescope fd cwd=./", noremap = true, desc = "Find files in subdir" },
		{
			"<leader>fd",
			find_files,
			noremap = true,
			desc = "Find files",
			silent = true,
		},
		{
			"<leader>fb",
			buffers,
			noremap = true,
			desc = "Find buffers",
			silent = true,
		},
		{
			"<leader>fm",
			marks,
			noremap = true,
			desc = "Find marks",
			silent = true,
		},
		{ "<leader>fg", ":Telescope live_grep cwd=./", noremap = true, desc = "Live grep" },
		{ "<leader>fig", ":Telescope grep_string cwd=./", noremap = true, desc = "Grep" },
		{ "<leader>fa", ":Telescope ast_grep theme=ivy cwd=./", noremap = true, desc = "Ast Grep" },
		{
			"<leader>fc",
			":Telescope neoclip theme=ivy<CR>",
			noremap = true,
			desc = "Clipboard",
			silent = true,
		},
		{
			"<leader>fr",
			resume,
			noremap = true,
			desc = "Resume telescope",
			silent = true,
		},
		{
			"<leader>fz",
			fzf_find,
			noremap = true,
			desc = "Grep in current file",
			silent = true,
		},
		{
			"<leader>ft",
			lsp_symbols,
			noremap = true,
			desc = "LSP symbols in current file",
			silent = true,
		},
		{
			"<leader>fw",
			lsp_workspace_symbols,
			noremap = true,
			desc = "LSP symbols in workspace",
			silent = true,
		},
		{
			"<leader>fs",
			tasks,
			noremap = true,
			desc = "Tasks",
			silent = true,
		},
		{
			"<leader>fv",
			symbols,
			noremap = true,
			desc = "Symbols",
			silent = true,
		},
		{
			"<leader>fp",
			projects,
			noremap = true,
			desc = "Projects",
			silent = true,
		},
		{
			"<leader>jl",
			"<cmd>Telescope jumplist theme=ivy<CR>",
			noremap = true,
			desc = "Jumplist",
			silent = true,
		},
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
		telescope.load_extension("ast_grep")
		-- require("telescope-tasks.generators").default.all()
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
		pickers = {
			grep_string = {
				theme = "ivy",
			},
			live_grep = {
				theme = "ivy",
			},
			buffers = {
				theme = "ivy",
			},
			fd = {
				theme = "ivy",
			},
			current_buffer_fuzzy_find = {
				theme = "ivy",
			},
			lsp_document_symbols = {
				theme = "ivy",
			},
			lsp_workspace_symbols = {
				theme = "ivy",
			},
			marks = {
				theme = "ivy",
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
