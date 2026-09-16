vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("defntvdm_lsp_attach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr = ev.buf
		if not client then
			return
		end

		if client.server_capabilities.documentSymbolProvider and client.name ~= "vue_ls" then
			local navic = require("nvim-navic")
			navic.attach(client, bufnr)
		end

		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
			vim.keymap.set("n", "<leader>ih", function()
				local filter = { bufnr = bufnr }
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
				if vim.lsp.inlay_hint.is_enabled(filter) then
					vim.notify("Inlay hints enabled")
				else
					vim.notify("Inlay hints disabled")
				end
			end, { silent = true, noremap = true, buffer = bufnr, desc = "Toggle inlay hints" })
		end

		if client.server_capabilities.codeLensProvider then
			vim.lsp.codelens.enable(true, { bufnr = bufnr })
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
	local vue_language_server_path = vim.fn.stdpath("data")
		.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

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
		tombi = {
			root_markers = { ".tombi.toml" },
		},
		ts_ls = {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
		vue_ls = {},
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
					checkOnSave = true,
					check = {
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
		basedpyright = {},
		ruff = {},
		lua_ls = {
			settings = {
				Lua = {
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
	}
end

return {
	"neovim/nvim-lspconfig",
	enabled = not vim.g.vscode,
	dependencies = {
		"SmiteshP/nvim-navic",
		"mason-org/mason-lspconfig.nvim",
		"mason-org/mason.nvim",
		"folke/lazydev.nvim",
		"b0o/schemastore.nvim",
	},
	ft = defntvdm_filetypes,
	config = function()
		local custom_capabilities = require("blink.cmp").get_lsp_capabilities()
		custom_capabilities.workspace = custom_capabilities.workspace or {}
		custom_capabilities.workspace.didChangeWatchedFiles = custom_capabilities.workspace.didChangeWatchedFiles or {}
		custom_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

		local servers = get_servers()
		for name, cfg in pairs(servers) do
			cfg.capabilities = custom_capabilities
			vim.lsp.config(name, cfg)
		end

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_enable = {
				exclude = { "ty" },
			},
		})
	end,
}
