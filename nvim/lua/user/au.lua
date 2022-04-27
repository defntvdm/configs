local events = {
    FileType = {
        {
            pattern = 'go',
            callback = function ()
                vim.bo.expandtab = false
            end
        },
		{
			pattern = 'NvimTree',
			callback = function ()
                local opt = { buffer = true }
				vim.keymap.set('n', 'l', function ()
					require'nvim-tree.actions'.on_keypress('edit')
				end,
                opt)
				vim.keymap.set('n', 'h', function ()
					require'nvim-tree.actions'.on_keypress('close_node')
				end,
                opt)
			end
		}
    },
    BufNewFile = {
        {
            pattern = '.localnvim',
            callback = function()
                vim.bo.filetype = 'vim'
            end,

        },
        -- YANDEX >>>
        {
            pattern = 'ya.make',
            callback = function()
                vim.bo.filetype = 'yamake'
            end,
        }
        -- YANDEX <<<
    },
    BufRead = {
        {
            pattern = '.localnvim',
            callback = function()
                vim.bo.filetype = 'vim'
            end,

        },
        -- YANDEX >>>
        {
            pattern = 'ya.make',
            callback = function()
                vim.bo.filetype = 'yamake'
            end,
        }
        -- YANDEX <<<
    },
}

for event, opts in pairs(events) do
    for _, opt in pairs(opts) do
        vim.api.nvim_create_autocmd(event, opt)
    end
end
