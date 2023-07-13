local function toggle()
	require("barbecue.ui").toggle()
end

local function up1()
	pcall(require("barbecue.ui").navigate, -1)
end

local function up2()
	pcall(require("barbecue.ui").navigate, -2)
end

return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"kyazdani42/nvim-web-devicons",
	},
	keys = {
		{ "<leader>fr", toggle, noremap = true, silent = true },
		{ "<C-y>", up1, noremap = true, silent = true },
		{ "<C-u>", up2, noremap = true, silent = true },
	},
	lazy = true,
	opts = {},
}
