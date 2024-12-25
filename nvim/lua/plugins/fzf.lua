return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AckslD/nvim-neoclip.lua",
	},
	lazy = false,
	keys = {
		{ "<leader>ff", ":FzfLua files cwd=./", noremap = true, desc = "Find files in subdir" },
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			noremap = true,
			mode = "n",
			silent = true,
			desc = "Find vim help",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").files()
			end,
			mode = "n",
			noremap = true,
			desc = "Find files",
			silent = true,
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			mode = "n",
			noremap = true,
			desc = "Find buffers",
			silent = true,
		},
		{
			"<leader>fm",
			function()
				require("fzf-lua").marks()
			end,
			mode = "n",
			noremap = true,
			desc = "Find marks",
			silent = true,
		},
		{ "<leader>fg", ":FzfLua live_grep cwd=./", noremap = true, desc = "Live grep" },
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			mode = "n",
			noremap = true,
			desc = "Resume fzf-lua",
			silent = true,
		},
		{
			"<leader>fz",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			mode = "n",
			noremap = true,
			desc = "Grep in current file",
			silent = true,
		},
		{
			"<leader>ft",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			noremap = true,
			desc = "LSP symbols in current file",
			mode = "n",
			silent = true,
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").lsp_live_workspace_symbols()
			end,
			noremap = true,
			desc = "LSP symbols in workspace",
			mode = "n",
			silent = true,
		},
		{
			"<leader>jl",
			function()
				require("fzf-lua").jumps()
			end,
			noremap = true,
			desc = "Jumplist",
			mode = "n",
			silent = true,
		},
		{
			"<leader>fc",
			function()
				require("neoclip.fzf")()
			end,
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Clipboard",
		},
	},
	config = function()
		require("fzf-lua").setup({
			"telescope",
			treesitter = {
				enable = true,
			},
		})
	end,
}
