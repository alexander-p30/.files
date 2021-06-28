lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "ruby", "html", "javascript", "c"},
  highlight = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
    colors = {
        "#c678dd",
        "#d19a66",
        "#56b6c2",
        "#ff6bf3",
        "#666bd1",
        "#c27556",
    }
  },
}
EOF

