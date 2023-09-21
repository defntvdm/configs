local function toggle()
	require("barbecue.ui").toggle()
end

local function up1()
	pcall(require("barbecue.ui").navigate, -1)
end

return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"kyazdani42/nvim-web-devicons",
	},
	keys = {
		{ "<leader>fr", toggle, noremap = true, silent = true },
		{ "<C-u>", up1, noremap = true, silent = true },
	},
	lazy = true,
	opts = {
		theme = "onedark",
	},
}
