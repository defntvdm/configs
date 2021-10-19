require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = 'nvim-cmp'
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          my_workspace = "~/neorg"
        }
      }
    }
  },
  hook = function()
    local neorg_callbacks = require('neorg.callbacks')

    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
      keybinds.map_event_to_mode("norg", {
        n = {
          { "<M-d>", "core.norg.qol.todo_items.todo.task_done" },
          { "<M-u>", "core.norg.qol.todo_items.todo.task_undone" },
          { "<M-s>", "core.norg.qol.todo_items.todo.task_pending" },
          { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }
        },
      }, { silent = true, noremap = true })
    end)
  end
}


local parser_configs = require'nvim-treesitter.parsers'.get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg',
        files = { 'src/parser.c', 'src/scanner.cc' },
        branch = 'main'
    },
}
