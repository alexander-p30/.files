require('lualine').setup({
  options = { theme = 'onedark' },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
        'filename',
        -- path = 1,
        -- file_status = true,
        -- path = 0
      },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
