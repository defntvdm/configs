local myaugroup = vim.api.nvim_create_augroup("defntvdm_custom", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
	desc = "Refresh codeLens",
	group = myaugroup,
	callback = function()
		vim.lsp.codelens.refresh({ bufn = 0 })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight copied text",
	group = myaugroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Switch relativenumber off",
	group = myaugroup,
	callback = function()
		if vim.o.number then
			vim.o.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	desc = "Switch relativenumber on",
	group = myaugroup,
	callback = function()
		if vim.o.number then
			vim.o.relativenumber = true
		end
	end,
})
