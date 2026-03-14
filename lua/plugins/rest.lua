return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  commit = "8b62563", -- Use stable commit
  config = function()
    require("rest-nvim").setup({
      -- Skip default settings for brevity
    })
  end,
  keys = {
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run REST request" },
    { "<leader>rp", "<cmd>Rest preview<cr>", desc = "Preview REST request" },
  },
}
