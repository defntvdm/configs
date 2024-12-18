return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VimEnter",
	config = function()
		local palettes = require("catppuccin.palettes").get_palette("macchiato")
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = palettes.base },
					},
				},
			}),
			options = {
				mode = "tabs",
				themable = true,
				numbers = "buffer_id",
				indicator = {
					style = "underline",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
