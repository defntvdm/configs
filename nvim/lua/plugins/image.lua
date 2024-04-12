return {
	"3rd/image.nvim",
	event = "VeryLazy",
	enabled = false,
	opts = {
		backend = "kitty",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = true,
				download_remote_images = true,
				only_render_image_at_cursor = true,
				filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
			},
			neorg = {
				enabled = false,
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = false,
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		editor_only_render_when_focused = false,
		tmux_show_only_in_active_window = false,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.heic" },
		kitty_method = "normal",
	},
}
