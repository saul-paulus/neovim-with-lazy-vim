return {
  "gorbit99/codewindow.nvim",
  event = "VeryLazy",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      auto_enable = false,
      exclude_filetypes = { "help", "netrw", "NvimTree", "neo-tree", "dashboard", "lazy", "mason" },
      minimap_width = 15,
      z_index = 1,
      max_minimap_height = nil,
      active_in_terminals = false,
      window_border = "none"
    })
    codewindow.apply_default_keybinds()
  end,
}
