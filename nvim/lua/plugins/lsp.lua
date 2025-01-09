local _border = "rounded"

vim.diagnostic.config({
	float = { border = _border },
})

function _G.custom_attach(client, bufnr)
	-- enable navic if lsp supports
	if client.server_capabilities.documentSymbolProvider and client.name ~= "volar" then
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
	end

	local opts = { silent = true, noremap = true, buffer = bufnr }

	if client.server_capabilities.inlayHintProvider ~= nil then
		vim.lsp.inlay_hint.enable(true)
		vim.keymap.set("n", "<leader>ih", function()
			if vim.lsp.inlay_hint.is_enabled() then
				vim.lsp.inlay_hint.enable(false)
				vim.notify("Inlay hints disabled")
			else
				vim.lsp.inlay_hint.enable(true)
				vim.notify("Inlay hints enabled")
			end
		end, opts)
	end

	-- Mappings.
	vim.keymap.set("n", "gd", function()
		require("fzf-lua").lsp_definitions()
	end, opts)
	vim.keymap.set("n", "gD", function()
		local actions = require("fzf-lua").actions
		require("fzf-lua").lsp_definitions({
			jump_to_single_result_action = actions.file_tabedit,
		})
	end, opts)
	vim.keymap.set("n", "gy", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)
	vim.keymap.set("n", "gi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)
	vim.keymap.set("n", "gr", function()
		require("fzf-lua").lsp_references()
	end, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", " lic", function()
		require("fzf-lua").lsp_incoming_calls()
	end, opts)
	vim.keymap.set("n", " loc", function()
		require("fzf-lua").lsp_outgoing_calls()
	end, opts)
	vim.keymap.set("n", " wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", " wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", " wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", " rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", " e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)
	vim.keymap.set({ "n", "v" }, " ca", function()
		require("fzf-lua").lsp_code_actions({ previewer = "codeaction_native" })
	end, opts)
	vim.keymap.set("n", "<leader>tl", function()
		if vim.diagnostic.is_enabled() then
			vim.diagnostic.enable(false)
			vim.notify("Diagnostic disabled")
		else
			vim.diagnostic.enable(true)
			vim.notify("Diagnostic enabled")
		end
	end, opts)

	if client.name == "clangd" then
		vim.keymap.set("n", "<M-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
		vim.keymap.set("n", "ø", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
	end

	if client.name == "gopls" then
		vim.keymap.set("n", " im", "<cmd>Telescope goimpl<CR>", opts)
	end
end

local function get_servers()
	local util = require("lspconfig.util")
	return {
		ansiblels = {},
		bashls = {},
		buf_ls = {},
		cmake = {},
		cssls = {},
		dockerls = {},
		emmet_language_server = {},
		graphql = {},
		html = {},
		hyprls = {},
		jinja_lsp = {
			filetypes = { "jinja", "htmldjango" },
		},
		jsonls = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
		kotlin_language_server = {},
		taplo = {},
		ts_ls = {
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		},
		vimls = {},
		volar = {},
		yamlls = {
			settings = {
				yaml = {
					validate = true,
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		},
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
				"--offset-encoding=utf-8",
				"--completion-style=detailed",
				"--log=error",
				"-j=4",
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
			root_dir = util.root_pattern("go.work", "go.mod", ".git", "main.go"),
			settings = {
				gopls = {
					completeUnimported = true,
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
					pythonPath = "/home/defntvdm/.pyenv/shims/python",
				},
				pyright = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = false,
					},
				},
			},
		},
		ruff = {
			init_options = {
				settings = {
					configuration = "~/.config/nvim/presets/ruff.toml",
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
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		},
	}
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"SmiteshP/nvim-navic",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"folke/lazydev.nvim",
		"b0o/schemastore.nvim",
	},
	ft = defntvdm_filetypes,
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		require("lspconfig.ui.windows").default_options = {
			border = _border,
		}

		local nvim_lsp = require("lspconfig")

		_G.custom_capabilities = require("blink.cmp").get_lsp_capabilities()
		_G.custom_capabilities.workspace = _G.custom_capabilities.workspace or {}
		_G.custom_capabilities.workspace.didChangeWatchedFiles = _G.custom_capabilities.workspace.didChangeWatchedFiles
			or {}
		_G.custom_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
		for name, cfg in pairs(get_servers()) do
			cfg.on_attach = custom_attach
			cfg.capabilities = custom_capabilities
			nvim_lsp[name].setup(cfg)
		end
	end,
}
