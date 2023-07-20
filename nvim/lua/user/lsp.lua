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

function _G.custom_attach(client, bufnr)
	local opts = { silent = true, noremap = true, buffer = bufnr }

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.server_capabilities.inlayHintProvider ~= nil then
		vim.lsp.inlay_hint(bufnr, true)
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, opts)
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
	bashls = {},
	bufls = {},
	cmake = {},
	cssls = {},
	dockerls = {},
	graphql = {},
	html = {},
	jsonls = {},
	taplo = {},
	tsserver = {},
	vimls = {},
	vuels = {},
	yamlls = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=never",
			"--offset-encoding=utf-16",
			"--completion-style=detailed",
			"--log=error",
			"-j=8",
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	},
	gopls = {
		cmd = { "gopls", "serve" },
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
	},
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
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
	},
	lua_ls = {
		settings = {
			Lua = {
				["workspace.library"] = {
					["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua"] = true,
					["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua/vim"] = true,
					["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua/vim/lsp"] = true,
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"ray-x/lsp_signature.nvim",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
	keys = {
		{ " e", vim.diagnostic.open_float, noremap = true, silent = true },
		{ "[d", vim.diagnostic.goto_prev, noremap = true, silent = true },
		{ "]d", vim.diagnostic.goto_next, noremap = true, silent = true },
		{ " ca", vim.lsp.buf.code_action, mode = { "n", "v" }, noremap = true, silent = true },
	},
	event = "FileType cpp,go,python,rust,html,css,lua,javascript,typescript,javascriptreact,typescriptreact,vue,yaml,json",
	config = function()
		-- beautiful signature
		require("lsp_signature").setup()

		-- autoinstall lsps
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})

		require("lspconfig.ui.windows").default_options = {
			border = _border,
		}

		require("barbecue")

		_G.custom_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local nvim_lsp = require("lspconfig")
		for name, cfg in pairs(servers) do
			cfg.on_attach = custom_attach
			cfg.capabilities = custom_capabilities
			nvim_lsp[name].setup(cfg)
		end
		vim.cmd("LspStart")
	end,
}
