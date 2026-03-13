return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "doom",
    config = {
      week_header = {
        enable = true,
      },
      header = {
        "󰊠 Neovim Professional Workspace",
      },
      center = {
        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = " ",
          key = "f",
        },
        {
          action = "Telescope live_grep",
          desc = " Search in project",
          icon = " ",
          key = "s",
        },
        {
          action = "ene | startinsert",
          desc = " New file",
          icon = " ",
          key = "n",
        },
        {
          action = "NeoTreeShowToggle",
          desc = " File explorer",
          icon = " ",
          key = "e",
        },
        {
          action = "Lazy",
          desc = " Manage plugins",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = "qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      },
      footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return {
          "",
          string.format("Loaded %d plugins in %.2f ms", stats.count, ms),
        }
      end,
    },
  },
}