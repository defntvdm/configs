local function prev()
	require("luasnip").jump(-1)
end

local function next()
	require("luasnip").jump(1)
end

return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	keys = {
		{ "i", "<c-j>", next, silent = true, noremap = true },
		{ "i", "<c-k>", prev, silent = true, noremap = true },
		{ "s", "<c-j>", next, silent = true, noremap = true },
		{ "s", "<c-k>", prev, silent = true, noremap = true },
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
