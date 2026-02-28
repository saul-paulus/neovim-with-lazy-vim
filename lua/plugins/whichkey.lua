local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local which_key = require("which-key")
  which_key.setup({
    preset = "classic",
    win = {
      border = "rounded",
    },
  })

  which_key.add({
    { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
    { "<leader>a", group = "Tab" },
    { "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move Left" },
    { "<leader>al", "<cmd>+tabmove<cr>", desc = "Move Right" },
    { "<leader>an", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
    { "<leader>aN", "<cmd>tabnew %<cr>", desc = "New Tab" },
    { "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
    { "<leader>b", group = "Buffers" },
    { "<leader>c", "<cmd>bd<cr>", desc = "Close Buffer" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
    { "<leader>g", group = "Git" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Plugins" },
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit App" },
    { "<leader>t", group = "Test" },
    { "<leader>T", group = "Treesitter" },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    { "<leader>x", group = "Lists" },
    { "<leader>xl", "<cmd>lopen<cr>", desc = "Location List" },
    { "<leader>xq", "<cmd>copen<cr>", desc = "Quickfix List" },
  })
end

return M