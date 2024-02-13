return {
 {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      'AndreM222/copilot-lualine',
      'nvim-tree/nvim-web-devicons' 
    },
    config = function()
      require("lualine").setup ({
        options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            ignore_focus = { "NvimTree" },
            theme = "onedark",
            icons_enabled = true,
            disabled_filetypes = {
              "TelescopePrompt",
              "packer",
              "alpha",
              "dashboard",
              "Outline",
              "DressingInput",
              "toggleterm",
              "lazy",
              },
            always_divide_middle = true,
          },
        sections = {
          lualine_a = {},
          lualine_b = { "branch" },
          lualine_c = { "diagnostics" },
          lualine_x = { "copilot", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "quickfix", "man", "fugitive" },
      })
    end
  }
}
