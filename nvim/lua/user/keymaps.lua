local set_km = vim.keymap.set
vim.g.mapleader = "\\"
local opts = { noremap = true, silent = true }
set_km("n", "<space>", "<nop>", opts)

set_km("i", "<c-j>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], opts)
set_km("i", "<c-k>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], opts)
set_km("s", "<c-j>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], opts)
set_km("s", "<c-k>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], opts)

-- tabs
set_km("n", "<m-1>", ":BufferGoto 1<CR>", opts)
set_km("n", "<m-2>", ":BufferGoto 2<CR>", opts)
set_km("n", "<m-3>", ":BufferGoto 3<CR>", opts)
set_km("n", "<m-4>", ":BufferGoto 4<CR>", opts)
set_km("n", "<m-5>", ":BufferGoto 5<CR>", opts)
set_km("n", "<m-6>", ":BufferGoto 6<CR>", opts)
set_km("n", "<m-7>", ":BufferGoto 7<CR>", opts)
set_km("n", "<m-8>", ":BufferGoto 8<CR>", opts)
set_km("n", "<m-9>", ":BufferGoto 9<CR>", opts)
set_km("n", "<m-0>", "<cmd>tablast<CR>", opts)
set_km("n", "¡", ":BufferGoto 1<CR>", opts)
set_km("n", "™", ":BufferGoto 2<CR>", opts)
set_km("n", "£", ":BufferGoto 3<CR>", opts)
set_km("n", "¢", ":BufferGoto 4<CR>", opts)
set_km("n", "∞", ":BufferGoto 5<CR>", opts)
set_km("n", "§", ":BufferGoto 6<CR>", opts)
set_km("n", "¶", ":BufferGoto 7<CR>", opts)
set_km("n", "•", ":BufferGoto 8<CR>", opts)
set_km("n", "ª", ":BufferGoto 9<CR>", opts)
set_km("n", "º", "<cmd>tablast<CR>", opts)
set_km("n", " bd", ":BufferClose<CR>", opts)

-- noop
set_km("i", "<f1>", "<nop>", { noremap = true })
set_km("i", "<f2>", "<nop>", { noremap = true })
set_km("i", "<f3>", "<nop>", { noremap = true })
set_km("i", "<f4>", "<nop>", { noremap = true })
set_km("i", "<f5>", "<nop>", { noremap = true })
set_km("i", "<f6>", "<nop>", { noremap = true })
set_km("i", "<f7>", "<nop>", { noremap = true })
set_km("i", "<f8>", "<nop>", { noremap = true })
set_km("i", "<f9>", "<nop>", { noremap = true })
set_km("i", "<f10>", "<nop>", { noremap = true })
set_km("i", "<f11>", "<nop>", { noremap = true })
set_km("i", "<f12>", "<nop>", { noremap = true })

-- Telescope
set_km("n", "<leader>ff", ":Telescope find_files cwd=", { noremap = true })
set_km("n", "<leader>fb", ":Telescope buffers<CR>", opts)
set_km("n", "<leader>fg", ":Telescope live_grep cwd=", { noremap = true })
set_km("n", "<leader>fig", ":Telescope grep_string cwd=", { noremap = true })
set_km("n", "<leader>ft", ":Telescope lsp_document_symbols<CR>", opts)

-- markdown-preview.nvim
set_km("n", "<leader>mm", ":MarkdownPreviewToggle<CR>", opts)

-- replace selected
set_km("v", "<c-r>", [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- move line
set_km("n", "<m-j>", [[:m .+1<CR>==]], opts)
set_km("n", "<m-k>", [[:m .-2<CR>==]], opts)
set_km("v", "<m-j>", [[:m '>+1<CR>gv=gv]], opts)
set_km("v", "<m-k>", [[:m '<-2<CR>gv=gv]], opts)
set_km("n", "∆", [[:m .+1<CR>==]], opts)
set_km("n", "˚", [[:m .-2<CR>==]], opts)
set_km("v", "∆", [[:m '>+1<CR>gv=gv]], opts)
set_km("v", "˚", [[:m '<-2<CR>gv=gv]], opts)

-- copy/paste using system clipboard
set_km("v", "<c-c>c", '"+y', { noremap = true })
set_km("n", "<c-v>v", '"+P', { noremap = true })

-- new tab
set_km("n", "<c-t>", "<cmd>tabnew<CR>", { silent = true })

-- copy directory of current file
set_km("n", "cp", [[:let @+=expand("%:p:h")<CR>]], { silent = true })

-- code actions
set_km("n", " ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- quickfix navigation
set_km("n", "[q", ":cprev<cr>", { silent = true, noremap = true })
set_km("n", "]q", ":cnext<cr>", { silent = true, noremap = true })
