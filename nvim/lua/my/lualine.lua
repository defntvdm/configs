require'lualine'.setup{
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{ 'filename', path = 1 }},
        lualine_x = {'filetype', 'encoding', 'fileformat'},
        lualine_y = {'diff'},
        lualine_z = {'location'}
    },
    options = {
        theme = 'gruvbox',
    },
}
