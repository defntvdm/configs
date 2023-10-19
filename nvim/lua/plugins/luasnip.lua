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
		{ "<c-j>", next, mode = { "i", "s" }, silent = true, noremap = true },
		{ "<c-k>", prev, mode = { "i", "s" }, silent = true, noremap = true },
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({}) -- load friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load({ -- load custom snippets
			paths = { "./snippets" },
		})
	end,
}
