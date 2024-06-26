return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VimEnter",
	opts = {
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
	},
}
