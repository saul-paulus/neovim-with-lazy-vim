if vim.lsp and vim.lsp.get_clients then
  local orig_get_clients = vim.lsp.get_clients
  vim.lsp.get_clients = function(...)
    local clients = orig_get_clients(...)
    for _, client in ipairs(clients) do
      if client and client.supports_method and not rawget(client, "_supports_method_patched") then
        local orig = client.supports_method
        rawset(client, "_supports_method_patched", true)
        client.supports_method = function(self_or_method, ...)
          if type(self_or_method) == "string" then
            return orig(client, self_or_method, ...)
          end
          return orig(self_or_method, ...)
        end
      end
    end
    return clients
  end
end

require("core.lsp.handlers").setup()
require("core.lsp.mason")


