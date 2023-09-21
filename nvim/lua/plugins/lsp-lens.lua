return {
	"VidocqH/lsp-lens.nvim",
	event = "LspAttach",
	opts = {
		enable = false,
		include_declaration = false,
		sections = {
			definition = false,
			references = true,
			implements = true,
		},
		ignore_filetype = {
			"prisma",
		},
	},
}
