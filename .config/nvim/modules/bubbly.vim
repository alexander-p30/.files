lua <<EOF
vim.g.bubbly_statusline = {
  'mode',
  'path',
  'divisor',
  'branch',
  'progress',
  'filetype'
}

vim.g.bubbly_palette = {
  background = "#504945",
  foreground = "#e2cca9",
  black = "#282828",
  red = "#f2594b",
  green = "#b0b846",
  yellow = "#e9b143",
  blue = "#80aa9e",
  purple = "#d3869b",
  cyan = "#8bba7f",
  white = "#fbf1c7",
  lightgrey = "#5b534d",
  darkgrey = "#32302f",
}

vim.g.bubbly_colors = {
  path = { modified = { background = 'red', foreground = 'black' } },
  progress = {
    rowandcol = { background = 'yellow', foreground = 'black' },
  }
}

vim.g.bubbly_inactive_color = {
  background = 'lightgrey', foreground = 'foreground'
}

--[[
vim.g.bubbly_width = {
  path = { path = { 200 } }
}
--]]

--[[
vim.g.bubbly_filter = {
  mode = { 'fern' },
  path = { 'fern' },
  divisor = { 'fern' },
  branch = { 'fern' },
  progress = { 'fern' },
  filetype = { 'fern' }
}
--]]
EOF

