lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "ruby", "html", "javascript", "c"},
  highlight = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}
EOF

