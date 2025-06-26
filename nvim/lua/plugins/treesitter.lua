vim.keymap.set(
	"n",
	"<leader>tc",
	"<CMD>TSContext toggle<CR>",
	{ silent = true, noremap = true, desc = "Toggle TS context" }
)
return {
	"nvim-treesitter/nvim-treesitter",
	enabled = not vim.g.vscode,
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
	},
	event = "BufEnter",
	build = ":TSUpdate",
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"clojure",
			"cmake",
			"comment",
			"cpp",
			"css",
			"dockerfile",
			"dot",
			"fennel",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"html",
			"http",
			"hyprlang",
			"java",
			"javascript",
			"json",
			"kotlin",
			"latex",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"mermaid",
			"python",
			"query",
			"regex",
			"rust",
			"sql",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vue",
			"yaml",
		},
		sync_install = false,
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		auto_install = true,
	},
}
