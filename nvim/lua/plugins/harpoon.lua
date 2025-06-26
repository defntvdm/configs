local function add_file()
	require("harpoon"):list():add()
end

local function remove_file()
	require("harpoon"):list():remove()
end

local function toggle_menu()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

local function prev()
	require("harpoon"):list():prev({ ui_nav_wrap = true })
end

local function next()
	require("harpoon"):list():next({ ui_nav_wrap = true })
end

return {
	"ThePrimeagen/harpoon",
	enabled = not vim.g.vscode,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	branch = "harpoon2",
	keys = {
		{ " a", add_file, noremap = true, silent = true },
		{ " d", remove_file, noremap = true, silent = true },
		{ " m", toggle_menu, noremap = true, silent = true },
		{ " p", prev, noremap = true, silent = true },
		{ " n", next, noremap = true, silent = true },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
}
