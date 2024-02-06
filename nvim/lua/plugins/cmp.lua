return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		{ "jackieaskins/cmp-emmet", build = "npm run release" },
		"ray-x/cmp-treesitter",
	},
	event = "VeryLazy",
	config = function()
		local luasnip = require("luasnip")

		local cmp = require("cmp")
		cmp.setup({
			experimental = {
				ghost_text = true,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "",
				}),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				["<S-Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,
			},
			sources = {
				{ name = "emmet" },
				{ name = "nvim_lsp" },
				{ name = "treesitter" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "crates" },
			},
			sorting = {
				priority_weight = 10,
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					before = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[SNIP]",
							buffer = "[BUF]",
							path = "[PATH]",
							crates = "[CRAT]",
							emmet_vim = "[EMME]",
							treesitter = "[TRSI]",
						})[entry.source.name]
						return vim_item
					end,
				}),
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					before = function(entry, vim_item)
						vim_item.menu = ({
							path = "[PATH]",
							cmdline = "[CMD]",
						})[entry.source.name]
						return vim_item
					end,
				}),
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					before = function(entry, vim_item)
						vim_item.menu = ({
							buffer = "[BUF]",
						})[entry.source.name]
						return vim_item
					end,
				}),
			},
		})
	end,
}
