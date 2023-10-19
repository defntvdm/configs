return {
	"rest-nvim/rest.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "http" },
	config = function()
		require("rest-nvim").setup({
			result_split_horizontal = false,
			result_split_in_place = false,
			skip_ssl_verification = false,
			encode_url = true,
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				show_url = true,
				show_curl_command = false,
				show_http_info = true,
				show_headers = true,
				formatters = {
					json = "jq",
					html = function(body)
						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
					end,
				},
			},
			jump_to_request = true,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.http",
			callback = function()
				vim.keymap.set(
					"n",
					"gd",
					"<Plug>RestNvim",
					{ silent = true, noremap = true, desc = "Do REST request", buffer = true }
				)
			end,
		})
	end,
}
