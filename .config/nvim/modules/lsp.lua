local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --     -- Mappings.
  local opts = { noremap=true, silent=true }
  --         -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-w>gv', ':vs<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-w>gs', ':sp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-q>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.format { async = true } <CR>', opts)
end

local lsp_dirs = vim.fn.stdpath("data") .. "/lsp_servers"

nvim_lsp.elixirls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/elixir/elixir-ls/language_server.sh" },
}

nvim_lsp.efm.setup({
  capabilities = capabilities,
  filetypes = { "elixir" },
  cmd = { lsp_dirs .. "/efm/efm-langserver" }
})

nvim_lsp.gopls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/go/gopls" },
}

nvim_lsp.tsserver.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/tsserver/node_modules/typescript-language-server/lib/cli.js", "--stdio" },
}

nvim_lsp.clangd.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/clangd/clangd/bin/clangd" },
}

nvim_lsp.hls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/haskell/haskell-language-server-wrapper", "--lsp" },
}

nvim_lsp.rust_analyzer.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = { lsp_dirs .. "/rust/rust-analyzer" },
}

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "single"
  }
})

-- Auto-format on save
vim.api.nvim_command('autocmd BufWritePre *.ex lua vim.lsp.buf.format { timeout_ms = 500 }')
vim.api.nvim_command('autocmd BufWritePre *.exs lua vim.lsp.buf.format { timeout_ms = 500 }')
vim.api.nvim_command('autocmd BufWritePre *.go lua vim.lsp.buf.format { timeout_ms = 500 }')
vim.api.nvim_command('autocmd BufWritePre *.rs lua vim.lsp.buf.format { timeout_ms = 500 }')
