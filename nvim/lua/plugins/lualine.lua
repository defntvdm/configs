return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				component_separators = { "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { {
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				} },
				lualine_b = {
					"branch",
					"diff",
				},

				lualine_c = {
					{
						"filename",
						path = 1,
					},
					{
						"navic",
						color_correction = "static",
						navic_opts = {
							highlight = true,
						},
					},
				},
				lualine_x = { "encoding", "fileformat" },
				lualine_y = {
					{
						function()
							local msg = "no lsp"
							local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_active_clients()
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									if client.name == "null-ls" and msg ~= "no lsp" then
										goto continue
									end
									msg = client.name
								end
								::continue::
							end
							return msg
						end,
						icon = "",
						color = { fg = "#ffffff", gui = "bold" },
					},
					"filetype",
				},
				lualine_z = {
					"location",
					{
						function(a, b)
							local line = require("noice").api.status.mode.get(a, b)
							local m = line:match("recording @%S")
							if m ~= nil then
								return m
							end
							return ""
						end,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#1e1e2e", gui = "bold" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {
				"fugitive",
				"lazy",
				"mason",
				"neo-tree",
				"nvim-dap-ui",
				"oil",
				"quickfix",
				"toggleterm",
				"trouble",
			},
			tabline = {},
		})
	end,
}
