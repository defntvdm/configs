local function hint_char1()
	require("hop").hint_char1({})
end

local function hint_char2()
	require("hop").hint_char2({})
end

return {
	"phaazon/hop.nvim",
	branch = "v2",
	keys = {
		{ " w1", hint_char1, noremap = true },
		{ " w2", hint_char2, noremap = true },
	},
	opts = {},
}
