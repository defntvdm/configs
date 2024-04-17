vim.bo.expandtab = false

local function tag_to_struct(add)
	local flag = "-remove-tags"
	if add then
		flag = "-add-tags"
	end
	return function()
		vim.ui.input({ prompt = "Add tag", default = nil }, function(tag)
			if tag == nil or tag == "" then
				return
			end
			local file = vim.fn.expand("%")
			local struct = vim.fn.expand("<cword>")
			local Job = require("plenary.job")
			local data = nil
			Job:new({
				command = "gomodifytags",
				args = { flag, tag, "-file", file, "-struct", struct },
				cwd = vim.fn.getcwd(),
				env = { PATH = vim.env.PATH },
				on_exit = function(j, return_val)
					if return_val == 0 then
						data = j:result()
					end
				end,
			}):sync()
			if data ~= nil then
				vim.api.nvim_buf_set_lines(0, 0, -1, false, data)
			end
		end)
	end
end

vim.api.nvim_buf_create_user_command(0, "GoAddTag", tag_to_struct(true), {})
vim.api.nvim_buf_create_user_command(0, "GoDelTag", tag_to_struct(false), {})
