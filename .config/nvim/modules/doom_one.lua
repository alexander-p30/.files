require('doom-one').setup({
  cursor_coloring = true,
  terminal_colors = true,
  italic_comments = false,
  enable_treesitter = true,
  transparent_background = false,
  pumblend = {
    enable = true,
    transparency_amount = 20,
  },
  plugins_integrations = {
    gitgutter = true,
    telescope = true,
    whichkey = true,
    indent_blankline = true,
    vim_illuminate = true,
  },
})
