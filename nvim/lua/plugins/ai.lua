return {
	{
		"ravitemer/mcphub.nvim",
		lazy = true,
		opts = {
			extensions = {
				avante = {
					make_slash_commands = true,
				},
			},
		},
	},
	{
		"yetone/avante.nvim",
		enabled = not vim.g.vscode,
		build = "make",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
			"ravitemer/mcphub.nvim",
		},
		opts = {
			provider = "openrouter",
			providers = {
				openrouter = {
					__inherited_from = "openai",
					endpoint = "https://llm.api.cloud.yandex.net/v1",
					api_key_name = "YANDEX_CLOUD_API_KEY",
					model = "gpt://b1gjjsq1ndd2nlebntmu/qwen3-235b-a22b-fp8/latest",
				},
			},
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
			disabled_tools = {
				"list_files",
				"search_files",
				"read_file",
				"create_file",
				"rename_file",
				"delete_file",
				"create_dir",
				"rename_dir",
				"delete_dir",
				"bash",
			},
			input = {
				provider = "snacks",
				provider_opts = {
					title = "Avante Input",
					icon = " ",
				},
			},
		},
	},
}
