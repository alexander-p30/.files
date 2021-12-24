require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "ruby", "html", "javascript", "c", "go"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
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

