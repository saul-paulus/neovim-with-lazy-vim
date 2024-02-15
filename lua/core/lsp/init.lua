local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("core.lsp.mason")
require("core.lsp.config")  -- ini hanya untuk windows supaya jdtls jalan, kalau pakai linu x remark saja 
require("core.lsp.handlers").setup()
require("core.lsp.null-ls")
