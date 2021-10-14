vim.g.bubbly_statusline = {
  'mode',
  'path',
  'divisor',
  'branch',
  'progress',
  'filetype'
}

vim.g.bubbly_palette = {
  background = "#5C6370",
  foreground = "#ABB2BF",
  black = "#282C34",
  red = "#E06C75",
  green = "#98C379",
  yellow = "#E5C07B",
  blue = "#61AFEF",
  purple = "#C678DD",
  cyan = "#56B6C2",
  white = "#ABB2BF",
  lightgrey = "#75787D",
  darkgrey = "#3A3C41",
}

vim.g.bubbly_colors = {
  path = { modified = { background = 'red', foreground = 'black' } },
  progress = {
    rowandcol = { background = 'yellow', foreground = 'black' },
  }
}

vim.g.bubbly_inactive_color = { background = 'darkgrey' }

-- vim.g.bubbly_width = {
--   path = { path = { 200 } }
-- }

-- vim.g.bubbly_filter = {
--   mode = { 'fern' },
--   path = { 'fern' },
--   divisor = { 'fern' },
--   branch = { 'fern' },
--   progress = { 'fern' },
--   filetype = { 'fern' }
-- }
