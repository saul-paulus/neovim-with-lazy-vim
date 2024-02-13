return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    config = function()
      require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      }
    })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "cssls",
          "cssmodules_ls",
          "dockerls",
          "eslint",
          "golangci_lint_ls",
          "gopls",
          "html",
          "jsonls",
          "quick_lint_js",
          "intelephense",
          "phpactor",
          "psalm",
          "pyright",
          "tsserver"
        },
        handlers = nil,
        automatic_installation = false,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonUninstallAll", "MasonLog" }

      })
    end
  }
}
