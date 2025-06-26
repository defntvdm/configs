local function gendoc()
	require("neogen").generate()
end

return {
	"danymat/neogen",
	enabled = not vim.g.vscode,
	ft = defntvdm_filetypes,
	keys = {
		{
			"<leader>dd",
			gendoc,
			desc = "Generate docstring",
		},
	},
	opts = {
		snippet_engine = "luasnip",
		languages = {
			python = {
				template = {
					annotation_convention = "reST",
				},
			},
		},
	},
}
