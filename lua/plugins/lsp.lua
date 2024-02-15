return {
-- lsp
  {
    "neovim/nvim-lspconfig",
    event = "BufWinEnter",
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
    init = function()
      vim.tbl_map(function(plugin)
        pcall(require, plugin)
      end, { "lspconfig", "null-ls" })
    end,
  }
}
