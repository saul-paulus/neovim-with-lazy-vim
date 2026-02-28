return {
-- lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("core.lsp")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  }
}