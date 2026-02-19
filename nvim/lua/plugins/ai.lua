local default_adapter = "qwen_code"

return {
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
				adapter = default_adapter,
			},
			inline = {
				adapter = default_adapter,
			},
			cmd = {
				adapter = default_adapter,
			},
		},
		adapters = {
			acp = {
				qwen_code = function()
					return require("codecompanion.adapters").extend("gemini_cli", {
						name = "qwen_code",
						formatted_name = "Qwen Code",
						commands = {
							default = {
								"qwen",
								"--experimental-acp",
							},
							yolo = {
								"qwen",
								"--yolo",
								"--experimental-acp",
							},
						},
						defaults = {
							auth_method = "qwen-oauth",
							oauth_credentials_path = vim.fs.abspath("~/.qwen/oauth_creds.json"),
						},
						handlers = {
							-- do not auth again if oauth_credentials is already exists
							auth = function(self)
								local oauth_credentials_path = self.defaults.oauth_credentials_path
								return (oauth_credentials_path and vim.fn.filereadable(oauth_credentials_path)) == 1
							end,
						},
					})
				end,
			},
		},
		opts = {
			log_level = "ERROR",
		},
	},
}
