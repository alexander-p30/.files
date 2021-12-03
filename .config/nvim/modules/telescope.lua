local previewers = require('telescope.previewers')
local putils = require('telescope.previewers.utils')
local pfiletype = require('plenary.filetype')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then
    local ft = pfiletype.detect(filepath)
    opts.use_ft_detect = false
    putils.regex_highlighter(bufnr, ft)
  end
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
  defaults = {
    buffer_previewer_maker = new_maker,
  },
  color_devicons = true,
  pickers = {
    buffers = {
      show_all_buffers = true,
      previewer = false,
      mappings = {
        i = {
          ["<c-e>"] = "delete_buffer",
        },
        n = {
            ["d"] = "delete_buffer",
            ["<c-e>"] = "delete_buffer",
        }
      }
    }
  }
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<leader><space>', '<cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers theme=dropdown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gco', '<cmd>Telescope git_branches theme=ivy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gcc', '<cmd>Telescope git_commits theme=ivy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', '<cmd>Telescope help_tags theme=ivy<CR>', { noremap = true, silent = true })

