local events = {
	FileType = {
		{
			pattern = "go",
			callback = function()
				vim.bo.expandtab = false
			end,
		},
	},
	BufEnter = {
		{
			pattern = ".localnvim",
			callback = function()
				vim.bo.filetype = "vim"
			end,
		},
	},
}

for event, opts in pairs(events) do
	for _, opt in pairs(opts) do
		vim.api.nvim_create_autocmd(event, opt)
	end
end
