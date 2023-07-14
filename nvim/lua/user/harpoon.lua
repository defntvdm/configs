local function add_file()
	require("harpoon.mark").add_file()
end

local function toggle_menu()
	require("harpoon.ui").toggle_quick_menu()
end

local function prev()
	require("harpoon.ui").nav_prev()
end

local function next()
	require("harpoon.ui").nav_next()
end

return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ " a", add_file, noremap = true, silent = true },
		{ " m", toggle_menu, noremap = true, silent = true },
		{ " p", prev, noremap = true, silent = true },
		{ " n", next, noremap = true, silent = true },
	},
}
