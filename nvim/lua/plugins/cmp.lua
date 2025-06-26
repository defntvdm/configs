return {
	"saghen/blink.cmp",
	enabled = not vim.g.vscode,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saghen/blink.compat",
		"Kaiser-Yang/blink-cmp-avante",
	},
	version = "*",
	build = "cargo build --release",
	opts = {
		fuzzy = {
			implementation = "rust",
			prebuilt_binaries = {
				force_version = nil,
				-- ignore_version_mismatch = true,
			},
		},
		keymap = {
			preset = "super-tab",
			["<C-d>"] = { "scroll_documentation_down" },
			["<C-u>"] = { "scroll_documentation_up" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = { { "kind_icon" }, { "label", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = true,
			},
			trigger = {
				prefetch_on_insert = false,
			},
		},
		snippets = {
			preset = "luasnip",
		},
		cmdline = {
			enabled = true,
			keymap = {
				preset = "super-tab",
				["<C-d>"] = { "scroll_documentation_down" },
				["<C-u>"] = { "scroll_documentation_up" },
			},
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" then
					return { "cmdline", "path" }
				end
				return {}
			end,
			completion = {
				menu = {
					auto_show = true,
				},
				ghost_text = {
					enabled = true,
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
			},
			per_filetype = {
				AvanteInput = { "avante", "path", "snippets", "buffer" },
			},
		},

		signature = { enabled = false },
	},
	opts_extend = { "sources.default" },
}
