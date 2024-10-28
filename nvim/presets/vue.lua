local lsp = require("lspconfig")

local data_path = vim.fn.stdpath("data")
local location = data_path .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

lsp.ts_ls.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"vue",
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = location,
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})

lsp.volar.setup({
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	on_attach = custom_attach,
	capabilities = custom_capabilities,
})
