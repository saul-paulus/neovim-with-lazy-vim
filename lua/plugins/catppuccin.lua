return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- "mocha" is the dark variant of catppuccin
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mason = true,
        noice = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
