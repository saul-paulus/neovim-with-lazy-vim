return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  event = "VeryLazy",
  opts = {
    attach_navic = true,
    show_modified = true,
    create_autocmd = true, -- Let barbecue handle it
    lead_custom_section = function()
      return require("core.utils").get_tab()
    end,
  },
}
