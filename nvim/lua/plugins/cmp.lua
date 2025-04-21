return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saghen/blink.compat",
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
			preset = "default",
			["<C-e>"] = { "select_and_accept" },
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
		},
		snippets = {
			preset = "luasnip",
		},
		cmdline = {
			enabled = true,
			keymap = {
				preset = "default",
				["<C-e>"] = { "select_and_accept" },
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
		},
		signature = { enabled = false },
	},
	opts_extend = { "sources.default" },
}
