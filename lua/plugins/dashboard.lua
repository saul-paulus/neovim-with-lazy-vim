return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "doom",
    config = {
      header = { "NEOVIM - VSCODE STYLE" },
      center = {
        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      },
    },
  },
}