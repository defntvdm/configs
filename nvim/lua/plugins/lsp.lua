local _border = "rounded"

vim.diagnostic.config({
	float = { border = _border },
})

function _G.custom_attach(client, bufnr)
	-- enable navic and navbuddy if lsp supports
	if client.server_capabilities.documentSymbolProvider then
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
		local navbuddy = require("nvim-navbuddy")
		navbuddy.attach(client, bufnr)
	end

	local opts = { silent = true, noremap = true, buffer = bufnr }

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.server_capabilities.inlayHintProvider ~= nil then
		vim.lsp.inlay_hint.enable(bufnr, true)
	end

	-- Mappings.
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions theme=ivy<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions  theme=ivy jump_type=tab<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations theme=ivy<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=ivy<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", " lic", "<cmd>Telescope lsp_incoming_calls theme=ivy<CR>", opts)
	vim.keymap.set("n", " loc", "<cmd>Telescope lsp_outgoing_calls theme=ivy<CR>", opts)
	vim.keymap.set("n", " wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", " wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", " wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", "<leader>nb", "<cmd>Navbuddy<CR>", opts)
	vim.keymap.set("n", " rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>ih", function()
		if vim.lsp.inlay_hint.is_enabled() then
			vim.lsp.inlay_hint.enable(bufnr, false)
		else
			vim.lsp.inlay_hint.enable(bufnr, true)
		end
	end, opts)
	-- use formatter.nvim
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
	ast_grep = {},
	bashls = {},
	bufls = {},
	cmake = {},
	cssls = {},
	dockerls = {},
	emmet_language_server = {},
	graphql = {},
	html = {},
	jsonls = {},
	taplo = {},
	tsserver = {},
	vimls = {},
	volar = {},
	yamlls = {},
	phpactor = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					allFeatures = true,
					overrideCommand = {
						"cargo",
						"clippy",
						"--workspace",
						"--message-format=json",
						"--all-targets",
						"--all-features",
					},
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
		filetypes = {
			"go",
			"gomod",
			"gowork",
			"gotmpl",
		},
		settings = {
			gopls = {
				completeUnimported = true,
				expandWorkspaceToModule = false,
				semanticTokens = true,
				staticcheck = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
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
		"SmiteshP/nvim-navic",
		"SmiteshP/nvim-navbuddy",
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
	ft = {
		"cpp",
		"css",
		"less",
		"go",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"lua",
		"markdown",
		"php",
		"python",
		"rust",
		"typescript",
		"typescriptreact",
		"vue",
		"xml",
		"yaml",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		require("lspconfig.ui.windows").default_options = {
			border = _border,
		}

		local nvim_lsp = require("lspconfig")
		local util = require("lspconfig.util")
		local configs = require("lspconfig.configs")

		configs.ast_grep = {
			default_config = {
				cmd = { "sg", "lsp" },
				filetypes = { "java" },
				single_file_support = true,
				root_dir = util.root_pattern(".git", "sgconfig.yml"),
			},
		}

		_G.custom_capabilities = require("cmp_nvim_lsp").default_capabilities()
		for name, cfg in pairs(servers) do
			cfg.on_attach = custom_attach
			cfg.capabilities = custom_capabilities
			if name == "gopls" then
				cfg.root_dir = util.root_pattern("go.work", "go.mod", ".git", "main.go")
			end
			nvim_lsp[name].setup(cfg)
		end
		vim.cmd("LspStart")
	end,
}
