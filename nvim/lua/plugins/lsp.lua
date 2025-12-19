vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr = ev.buf

		if client.server_capabilities.documentSymbolProvider and client.name ~= "volar" then
			local navic = require("nvim-navic")
			navic.attach(client, bufnr)
		end

		if client.server_capabilities.inlayHintProvider ~= nil then
			vim.lsp.inlay_hint.enable(false)
			vim.keymap.set("n", "<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				if vim.lsp.inlay_hint.is_enabled() then
					vim.notify("Inlay hints enabled")
				else
					vim.notify("Inlay hints disabled")
				end
			end, { silent = true, noremap = true, buffer = bufnr, desc = "Toggle inlay hints" })
		end

		if client.server_capabilities.codeLensProvider then
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = bufnr,
				callback = vim.lsp.codelens.refresh,
			})
			vim.lsp.codelens.refresh({ bufnr = bufnr })
			vim.keymap.set(
				"n",
				" cl",
				vim.lsp.codelens.run,
				{ silent = true, noremap = true, buffer = bufnr, desc = "Run codelens" }
			)
		end

		if client.server_capabilities.codeActionProvider then
			vim.keymap.set(
				{ "n", "v" },
				" ca",
				vim.lsp.buf.code_action,
				{ silent = true, noremap = true, buffer = bufnr, desc = "Code action" }
			)
		end

		-- Mappings.
		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { silent = true, noremap = true, buffer = bufnr, desc = "Definition" })
		vim.keymap.set("n", "gD", function()
			Snacks.picker.lsp_definitions({
				confirm = "tab",
			})
		end, { silent = true, noremap = true, buffer = bufnr, desc = "Definition in new tab" })
		vim.keymap.set("n", "gy", function()
			Snacks.picker.lsp_type_definitions()
		end, { silent = true, noremap = true, buffer = bufnr, desc = "Typdefs" })
		vim.keymap.set("n", "gi", function()
			Snacks.picker.lsp_implementations()
		end, { silent = true, noremap = true, buffer = bufnr, desc = "Implementations" })
		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { silent = true, noremap = true, buffer = bufnr, desc = "References" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true, buffer = bufnr, desc = "Hover" })
		vim.keymap.set(
			"n",
			" wa",
			vim.lsp.buf.add_workspace_folder,
			{ silent = true, noremap = true, buffer = bufnr, desc = "Add workspace folder" }
		)
		vim.keymap.set(
			"n",
			" wr",
			vim.lsp.buf.remove_workspace_folder,
			{ silent = true, noremap = true, buffer = bufnr, desc = "Remove workspace folder" }
		)
		vim.keymap.set(
			"n",
			" wl",
			"<cmd>lua vim.print(vim.lsp.buf.list_workspace_folders())<CR>",
			{ silent = true, noremap = true, buffer = bufnr, desc = "Print workspace folder" }
		)
		vim.keymap.set(
			"n",
			" rn",
			vim.lsp.buf.rename,
			{ silent = true, noremap = true, buffer = bufnr, desc = "Rename" }
		)
		vim.keymap.set(
			"i",
			"<c-k>",
			vim.lsp.buf.signature_help,
			{ silent = true, noremap = true, buffer = bufnr, desc = "Signature help" }
		)

		if client.name == "clangd" then
			vim.keymap.set(
				"n",
				"<M-o>",
				"<cmd>LspClangdSwitchSourceHeader<CR>",
				{ silent = true, noremap = true, buffer = bufnr, desc = "Switch to header/source" }
			)
			vim.keymap.set(
				"n",
				"ø",
				"<cmd>LspClangdSwitchSourceHeader<CR>",
				{ silent = true, noremap = true, buffer = bufnr, desc = "Switch to header/source" }
			)
		end
	end,
})

local function get_servers()
	return {
		cssls = {},
		tailwindcss = {},
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
					lens = {
						enable = true,
					},
					inlayHints = {
						enable = true,
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
			root_markers = { "go.work", "go.mod", ".git", "main.go" },
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
					codelens = {
						generate = true,
						gc_details = true,
						test = true,
					},
				},
			},
		},
		ty = {},
		lua_ls = {
			settings = {
				Lua = {
					["workspace.library"] = {
						["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua"] = true,
						["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua/vim"] = true,
						["/opt/homebrew/Cellar/neovim/CUSTOM/share/nvim/runtime/lua/vim/lsp"] = true,
						["/home/defntvdm/.local/share/nvim/runtime/lua"] = true,
						["/home/defntvdm/.local/share/nvim/runtime/lua/vim"] = true,
						["/home/defntvdm/.local/share/nvim/runtime/lua/vim/lsp"] = true,
						["/usr/share/nvim/runtime/lua"] = true,
						["/usr/share/nvim/runtime/lua/vim"] = true,
						["/usr/share/nvim/runtime/lua/vim/lsp"] = true,
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
		tflint = {},
		terraformls = {},
	}, { "basedpyright", "ruff" }
end

return {
	"neovim/nvim-lspconfig",
	enabled = not vim.g.vscode,
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
			border = "rounded",
		}

		local custom_capabilities = require("blink.cmp").get_lsp_capabilities()
		custom_capabilities.workspace = custom_capabilities.workspace or {}
		custom_capabilities.workspace.didChangeWatchedFiles = custom_capabilities.workspace.didChangeWatchedFiles or {}
		custom_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

		local enabled, disabled = get_servers()
		for name, cfg in pairs(enabled) do
			cfg.capabilities = custom_capabilities
			vim.lsp.config(name, cfg)
		end
		vim.lsp.enable(disabled, false)
	end,
}
