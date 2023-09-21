local function stylua()
	return {
		exe = "stylua",
		args = {
			"--search-parent-directories",
			"-",
		},
		stdin = true,
	}
end

local function clang_format()
	return {
		exe = "clang-format",
		stdin = true,
	}
end

local function goimports()
	return {
		exe = "goimports",
		args = {},
		stdin = true,
	}
end

local function isort()
	return {
		exe = "isort",
		args = { "-q", "-" },
		stdin = true,
	}
end

local function black()
	return {
		exe = "black",
		args = {
			"-S",
			"-l150",
			"--fast",
			"-",
		},
		stdin = true,
	}
end

local function rustfmt()
	return {
		exe = "rustfmt",
		args = { "--edition 2021" },
		stdin = true,
	}
end

local function djlint()
	local util = require("formatter.util")
	return {
		exe = "djlint",
		args = {
			util.get_current_buffer_file_path(),
			"--reformat",
			"--format-css",
			"--format-js",
			"-",
		},
		stdin = true,
	}
end

local function prettier4space()
	local util = require("formatter.util")
	return {
		exe = "prettier",
		args = {
			"--single-quote",
			"--jsx-single-quote",
			"--tab-width=4",
			"--end-of-line=lf",
			"--trailing-comma=all",
			"--print-width=150",
			"--stdin-filepath",
			util.get_current_buffer_file_name(),
		},
		stdin = true,
	}
end

local function prettier()
	local util = require("formatter.util")
	return {
		exe = "prettier",
		args = {
			"--single-quote",
			"--jsx-single-quote",
			"--tab-width=2",
			"--end-of-line=lf",
			"--trailing-comma=all",
			"--print-width=150",
			"--stdin-filepath",
			util.get_current_buffer_file_name(),
		},
		stdin = true,
	}
end

local formatters = {
	lua = stylua,
	c = clang_format,
	cpp = clang_format,
	go = goimports,
	python = { isort, black },
	rust = rustfmt,
	html = prettier,
	css = prettier,
	javascript = prettier,
	typescript = prettier,
	javascriptreact = prettier,
	typescriptreact = prettier,
	vue = prettier,
	yaml = prettier,
	json = prettier4space,
	htmldjango = djlint,
}

return {
	"mhartington/formatter.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	ft = {
		"c",
		"cpp",
		"go",
		"python",
		"rust",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"yaml",
		"json",
		"htmldjango",
	},
	keys = {
		{ " f", ":Format<CR>", mode = { "v", "n" }, noremap = true, silent = true, desc = "Formatting" },
	},
	config = function(_, opts)
		require("mason")
		require("formatter").setup(opts)
	end,
	opts = {
		logging = true,
		log_level = vim.log.levels.ERROR,
		filetype = formatters,
	},
}
