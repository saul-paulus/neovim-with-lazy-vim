local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.setup = function()
  local config = {
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = " ",
        [vim.diagnostic.severity.INFO] = " ",
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
    config = vim.tbl_deep_extend("force", { border = "rounded" }, config or {})
    return vim.lsp.handlers.hover(err, result, ctx, config)
  end

  vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
    config = vim.tbl_deep_extend("force", { border = "rounded" }, config or {})
    return vim.lsp.handlers.signature_help(err, result, ctx, config)
  end
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then return end
  navic.attach(client, bufnr)
end

local function lsp_keymaps(bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "gr", vim.lsp.buf.references, "Go to References")
  map("n", "gl", vim.diagnostic.open_float, "Open Diagnostic Float")
  map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format Document")
  map("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
  map("n", "<leader>lI", "<cmd>Mason<cr>", "Mason Info")
  map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>lj", function()
    if vim.diagnostic.jump then
      vim.diagnostic.jump({ count = 1 })
    else
      vim.diagnostic.goto_next({ buffer = 0 })
    end
  end, "Next Diagnostic")
  map("n", "<leader>lk", function()
    if vim.diagnostic.jump then
      vim.diagnostic.jump({ count = -1 })
    else
      vim.diagnostic.goto_prev({ buffer = 0 })
    end
  end, "Previous Diagnostic")
  map("n", "<leader>lr", vim.lsp.buf.rename, "Rename Symbol")
  map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
  map("n", "<leader>lq", vim.diagnostic.setloclist, "Set Location List")
end

M.on_attach = function(client, bufnr)
  if client and client.supports_method then
    local orig_supports_method = client.supports_method
    client.supports_method = function(self_or_method, ...)
      if type(self_or_method) == "string" then
        return orig_supports_method(client, self_or_method, ...)
      end
      return orig_supports_method(self_or_method, ...)
    end
  end

  attach_navic(client, bufnr)

  -- Disable LSP formatting for servers handled by external formatters (e.g. conform.nvim)
  local disable_formatting = { "ts_ls", "tsserver", "volar", "intelephense", "phpactor", "tailwindcss" }
  for _, name in pairs(disable_formatting) do
    if client.name == name then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if status_ok then
    illuminate.on_attach(client)
  end
end

return M