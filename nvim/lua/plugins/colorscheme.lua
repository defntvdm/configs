return {
	"catppuccin/nvim",
	priority = 1000,
	module = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				barbecue = {
					dim_dirname = true,
					bold_basename = true,
					dim_context = true,
					alt_background = true,
				},
				dashboard = true,
				dropbar = true,
				gitsigns = true,
				harpoon = true,
				hop = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				markdown = true,
				mason = true,
				neotree = true,
				neotest = true,
				cmp = true,
				dap = {
					enabled = true,
					enable_ui = true,
				},
				noice = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				treesitter_context = true,
				treesitter = true,
				window_picker = true,
				symbols_outline = true,
				telekasten = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = true,
				which_key = true,
			},
		})
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
