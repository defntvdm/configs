require("lspconfig")

local data_path = vim.fn.stdpath("data")
local location = data_path .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
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
})

vim.lsp.config("volar", {
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
})
