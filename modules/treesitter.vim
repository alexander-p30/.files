lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "ruby", "html", "javascript", "c"},
  highlight = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = {
        "#c678dd",
        "#d19a66",
        "#98c379",
        "#e5c07b",
        "#be5046",
    }
  },
}
EOF

