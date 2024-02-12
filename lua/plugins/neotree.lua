return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
          source_selector = {
          winbar = false,
          statusline = false
        },
        efault_component_configs = {
          indent = {
            indent_size = 1,
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        vim.keymap.set("n", "<leader>t", "<cmd>Neotree reveal toggle<CR>", { noremap = true, silent = true })
      })
    end
  }
}
