local servers = {
  'lua_ls',
  'cssls',
  'html',
  'ts_ls',
  'pyright',
  'jsonls',
  'yamlls',
  'emmet_ls',
  'intelephense',
  'phpactor',
  'marksman',
  'eslint',
  'volar',
  'tailwindcss',
  'prismals'
}

local settings = {
  ui = {
    border = 'none',
    icons = {
      package_installed = '◍',
      package_pending = '◍',
      package_uninstalled = '◍',
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require('mason').setup(settings)
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local handlers = require('core.lsp.handlers')

for _, server in pairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local require_ok, conf_opts = pcall(require, 'core.lsp.settings.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  -- Suppress the deprecation warning from nvim-lspconfig in Neovim 0.11
  local original_deprecate = vim.deprecate
  vim.deprecate = function() end
  
  lspconfig[server].setup(opts)
  
  vim.deprecate = original_deprecate
end