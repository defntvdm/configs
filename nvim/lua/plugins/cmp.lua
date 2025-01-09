return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saghen/blink.compat",
    },
    build = "cargo build --release",
    opts = {
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
                    enabled = true,
                },
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
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
            preset = 'luasnip',
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            cmdline = function()
                local type = vim.fn.getcmdtype()
                if type == "/" or type == "?" then
                    return { "buffer" }
                end
                if type == ":" then
                    return { "cmdline", "path" }
                end
                return {}
            end,
        },
        signature = { enabled = false },
    },
    opts_extend = { "sources.default" },
}
