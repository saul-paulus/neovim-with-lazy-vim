local servers = {
  'lua_ls',
  'cssls',
  'html',
  'pyright',
  'jsonls',
  'yamlls',
  'emmet_ls',
  'intelephense',
  'marksman',
  'eslint',
  'volar',
  'tailwindcss',
  'prismals',
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

local handlers = require('core.lsp.handlers')

for _, server in pairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local require_ok, conf_opts = pcall(require, 'core.lsp.settings.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', opts, conf_opts)
  end

  if vim.lsp.config then
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  else
    local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
    if lspconfig_status_ok then
      lspconfig[server].setup(opts)
    end
  end
end