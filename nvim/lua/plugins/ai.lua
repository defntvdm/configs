---@type opencode.Opts
vim.g.opencode_opts = {}

return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		keys = {
			{
				"<leader>cc",
				":CodeCompanionChat Toggle<CR>",
				mode = "n",
				noremap = false,
				silent = true,
				desc = "Toggle CodeCompanionChat",
			},
			{
				"<leader>cn",
				":CodeCompanionChat<CR>",
				mode = "n",
				noremap = false,
				silent = true,
				desc = "Toggle CodeCompanionChat",
			},
			{
				"<leader>ca",
				":CodeCompanionChat Add<CR>",
				mode = "v",
				noremap = false,
				silent = true,
				desc = "Add CodeCompanionChat",
			},
		},
		opts = {
			interactions = {
				chat = {
					adapter = {
						name = "opencode",
						model = "openai/gpt-5.6-terra",
					},
				},
				inline = {
					adapter = {
						name = "opencode",
						model = "openai/gpt-5.6-terra",
					},
				},
				cmd = {
					adapter = {
						name = "opencode",
						model = "openai/gpt-5.6-terra",
					},
				},
			},
			opts = {
				log_level = "ERROR",
			},
		},
	},
	{
		"nickjvandyke/opencode.nvim",
		version = "*",
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask()
				end,
				mode = { "n", "x" },
				noremap = false,
				silent = true,
				desc = "Ask OpenCode",
			},
			{
				"<leader>os",
				function()
					require("opencode").select()
				end,
				mode = { "n", "x" },
				noremap = false,
				silent = true,
				desc = "Ask OpenCode",
			},
		},
		config = function() end,
	},
}
