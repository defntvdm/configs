vim.g.neo_tree_remove_legacy_commands = 1

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local function toggle()
	require("neo-tree.command").execute({ toggle = true })
end

local function find_file()
	require("neo-tree.command").execute({ reveal = true })
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	event = "VimEnter",
	keys = {
		{
			"<leader>nf",
			find_file,
			desc = "Find file",
		},
		{
			"<C-n>",
			toggle,
			desc = "toggle",
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		require("lsp-file-operations").setup()
	end,
	opts = {
		close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		sort_case_insensitive = false,
		sort_function = nil,
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "ﰊ",
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "●",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "✖",
					renamed = "",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			position = "left",
			width = 40,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = {
					"toggle_node",
					nowait = false,
				},
				["l"] = "open_with_window_picker",
				["<cr>"] = "open_with_window_picker",
				["s"] = "split_with_window_picker",
				["v"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				["h"] = "close_node",
				["a"] = {
					"add",
					config = {
						show_path = "none",
					},
				},
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["q"] = "close_window",
				["R"] = "refresh",
				["<"] = "prev_source",
				[">"] = "next_source",
				["?"] = "show_help",
				["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
			},
		},
		nesting_rules = {},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true,
				hide_by_name = {
					--"node_modules"
				},
				hide_by_pattern = {
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = {
					--".gitignored",
				},
				never_show = {
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = {
					--".null-ls_*",
				},
			},
			follow_current_file = {
				enabled = false,
			},
			group_empty_dirs = false,
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = false,
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["#"] = "fuzzy_sorter",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
				},
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
			},
			group_empty_dirs = true,
			show_unloaded = true,
			window = {
				mappings = {
					["bd"] = "buffer_delete",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
				},
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
				},
			},
		},
		document_symbols = {
			window = {
				positon = "float",
				mappings = {
					["r"] = "rename",
				},
			},
		},
		sources = {
			"filesystem",
			"buffers",
			"git_status",
			"document_symbols",
		},
	},
}
