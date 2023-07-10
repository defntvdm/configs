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
vim.keymap.set("n", " e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", " q", "<cmd>TroubleToggle<CR>", opts)
vim.keymap.set({ "n", "v" }, " ca", vim.lsp.buf.code_action, opts)
vim.keymap.set({ "n", "v" }, " f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", opts)

function _G.custom_attach(client, bufnr)
    local opts = { silent = true, noremap = true, buffer = bufnr }

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.lsp.inlay_hint(bufnr, true)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    vim.keymap.set("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", " lic", "<cmd>Telescope lsp_incoming_calls<CR>", opts)
    vim.keymap.set("n", " loc", "<cmd>Telescope lsp_outgoing_calls<CR>", opts)
    vim.keymap.set("n", " wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", " wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", " wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.keymap.set("n", " rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint(bufnr, nil)
    end, opts)
    -- use null-ls
    client.server_capabilities.documentFormattingProvider = false

    if client.name == "clangd" then
        vim.keymap.set("n", "<M-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
        vim.keymap.set("n", "ø", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
    end

    if client.name == "gopls" then
        vim.keymap.set("n", " im", "<cmd>Telescope goimpl<CR>", opts)
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
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
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
