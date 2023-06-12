local nvim_lsp = require("lspconfig")

local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = _border,
})

vim.diagnostic.config({
    float = { border = _border },
})

require("lspconfig.ui.windows").default_options = {
    border = _border,
}

_G.custom_capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", " e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", " q", "<cmd>TroubleToggle<CR>", opts)
vim.api.nvim_set_keymap("n", " f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", opts)
vim.api.nvim_set_keymap("v", " f", "<cmd>lua vim.lsp.buf.format{async = false}<CR>", opts)

local ih = require("lsp-inlayhints")

function _G.custom_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- enable inlay hints
    ih.on_attach(client, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
    buf_set_keymap("n", "gD", ":Telescope lsp_type_definitions<CR>", opts)
    buf_set_keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)
    buf_set_keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
    buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", " lic", ":Telescope lsp_incoming_calls<CR>", opts)
    buf_set_keymap("n", " loc", ":Telescope lsp_outgoing_calls<CR>", opts)
    buf_set_keymap("n", " wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", " wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", " wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", " rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- use null-ls
    client.server_capabilities.documentFormattingProvider = false

    if client.name == "clangd" then
        buf_set_keymap("n", "<M-o>", "<cmd>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
        buf_set_keymap("n", "ø", "<cmd>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
    end

    if client.name == "gopls" then
        buf_set_keymap("n", " im", ":Telescope goimpl<CR>", { noremap = true, silent = true })
    end
end

local servers = {
    "bashls",
    "bufls",
    "cmake",
    "cssls",
    "dockerls",
    "graphql",
    "html",
    "jsonls",
    "taplo",
    "tsserver",
    "vimls",
    "vuels",
    "yamlls",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = custom_attach,
        capabilities = custom_capabilities,
    })
end

nvim_lsp.rust_analyzer.setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

nvim_lsp.clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--log=error",
        "-j=8",
        "--offset-encoding=utf-16",
    },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
})

nvim_lsp.gopls.setup({
    cmd = { "gopls", "serve" },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
    settings = {
        gopls = {
            usePlaceholders = true,
            expandWorkspaceToModule = false,
            semanticTokens = true,
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
})

nvim_lsp.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
    settings = {
        python = {
            pythonPath = "/Users/defntvdm/.pyenv/shims/python",
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
})

nvim_lsp.lua_ls.setup({
    settings = {
        Lua = {
            ["workspace.library"] = {
                ["/usr/share/nvim/runtime/lua"] = true,
                ["/usr/share/nvim/runtime/lua/vim"] = true,
                ["/usr/share/nvim/runtime/lua/vim/lsp"] = true,
            },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
