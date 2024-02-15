return {
	"brenton-leighton/multiple-cursors.nvim",
	event = "VeryLazy",
	config = function()
		require("multiple-cursors").setup()
		vim.keymap.set({ "n", "i" }, "<leader>.", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>")
	end,
}
