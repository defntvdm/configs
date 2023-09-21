vim.g.bookmark_no_default_key_mappings = 1
vim.g.bookmark_sign = "♥"
vim.g.bookmark_highlight_lines = 1
return {
	"MattesGroeger/vim-bookmarks",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "mm", "<Plug>BookmarkToggle", { silent = true })
		vim.keymap.set("n", "mi", "<Plug>BookmarkAnnotate", { silent = true })
		vim.keymap.set("n", "ma", require("telescope").extensions.vim_bookmarks.all, { silent = true })
		vim.keymap.set("n", "mf", require("telescope").extensions.vim_bookmarks.current_file, { silent = true })
		vim.keymap.set("n", "mc", "<Plug>BookmarkClear", { silent = true })
	end,
}
