local hop = require("hop")
hop.setup()

local opts = { remap = true }

vim.keymap.set("n", " w1", function()
    hop.hint_char1({})
end, opts)

vim.keymap.set("n", " w2", function()
    hop.hint_char2({})
end, opts)
