local SymbolKind = vim.lsp.protocol.SymbolKind

return {
	"Wansmer/symbol-usage.nvim",
	event = "LspAttach",
	keys = {
		{
			"<leader>su",
			function()
				require("symbol-usage").toggle()
			end,
			mode = "n",
			silent = true,
			noremap = true,
			desc = "Toggle Symbol Usage",
		},
	},
	opts = {
		hl = { link = "Comment" },
		kinds = { SymbolKind.Class, SymbolKind.Interface, SymbolKind.Struct },
		vt_position = "above",
		request_pending_text = "loading...",
		text_format = function(symbol)
			local fragments = {}
			if symbol.references then
				local usage = symbol.references <= 1 and "usage" or "usages"
				local num = symbol.references == 0 and "no" or symbol.references
				table.insert(fragments, ("%s %s"):format(num, usage))
			end
			if symbol.definition then
				table.insert(fragments, symbol.definition .. " defs")
			end
			if symbol.implementation then
				table.insert(fragments, symbol.implementation .. " impls")
			end
			return table.concat(fragments, ", ")
		end,
		references = { enabled = true, include_declaration = false },
		definition = { enabled = false },
		implementation = { enabled = true },
		filetypes = {},
	},
}
