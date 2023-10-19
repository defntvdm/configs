return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({})
	end,
	dependencies = { "kyazdani42/nvim-web-devicons" },
}
