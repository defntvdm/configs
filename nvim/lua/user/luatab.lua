return {
	"alvarosevilla95/luatab.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	opts = {
		modified = function(bufnr)
			return vim.fn.getbufvar(bufnr, "&modified") == 1 and "● " or ""
		end,
	},
}
