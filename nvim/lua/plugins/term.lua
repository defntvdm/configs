return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		size = 15,
		open_mapping = "<F2>",
		start_in_insert = true,
		direction = "horizontal",
		hide_numbers = true,
		shade_filetypes = {},
		insert_mappings = true,
		persist_size = false,
		persist_mode = false,
		close_on_exit = true,
		shell = vim.o.shell,
	},
}
