lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "ruby", "html", "javascript", "c"},
  highlight = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
    colors = {
      '#f2594b',
      '#e9b143',
      '#b0b846',
      '#8bba7f',
      '#80aa9e',
      '#d3869b'
    }
  },
}
EOF

