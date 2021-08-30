local nlsp = require'lspconfig'

_G.lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
_G.lsp_flags = {
    debounce_text_changes = 150,
}

function _G.lsp_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<f9>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- sudo npm i -g vscode-langservers-extracted typescript-language-server pyright vls dockerfile-language-server-nodejs
-- yay -S clang gopls rust_analyzer lua-language-server
-- sudo pip3 install cmake-language-server
local servers = { "gopls", "pyright", "rust_analyzer", "tsserver", "jsonls", "html", "vuels", "cmake", "dockerls" }
for _, server in pairs(servers) do
    nlsp[server].setup{
		on_attach = lsp_on_attach,
        capabilities = lsp_capabilities,
		flags = lsp_flags,
	}
end

nlsp.sumneko_lua.setup{
    cmd = { 'lua-language-server', },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

nlsp.clangd.setup{
    on_attach = function (client, bufnr)
        lsp_on_attach(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gc', ':ClangdSwitchSourceHeader<cr>', { silent = true, noremap=true })
    end,
    capabilities = lsp_capabilities,
    flags = lsp_flags,
}