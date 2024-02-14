local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine"
  }
}

function M.config()
  local horizon = require'lualine.themes.horizon'
  
  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = false, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
  }

   local filetype = {
    function()
      local filetype = vim.bo.filetype
      local upper_case_filetypes = {
        "json",
        "jsonc",
        "yaml",
        "toml",
        "css",
        "scss",
        "html",
        "xml",
      }

      if vim.tbl_contains(upper_case_filetypes, filetype) then
        return filetype:upper()
      end

      return filetype
    end,
  }

  require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = horizon,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = { "NvimTree" },
  always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {diagnostics, "filename"},
--- lualine_x = {'copilot','encoding','fileformat', filetype},
    lualine_x = {
        {
            'copilot',
            -- Default values
            symbols = {
                status = {
                    icons = {
                        enabled = " ",
                        sleep = " ",   -- auto-trigger disabled
                        disabled = " ",
                        warning = " ",
                        unknown = " "
                    },
                    hl = {
                        enabled = "#50FA7B",
                        sleep = "#AEB7D0",
                        disabled = "#6272A4",
                        warning = "#FFB86C",
                        unknown = "#FF5555"
                    }
                },
                spinners = require("copilot-lualine.spinners").dots,
                spinner_color = "#6272A4"
            },
            show_colors = true,
            show_loading = true
        },
        'encoding',
        'fileformat',
        'filetype'
  },
  lualine_y = {'progress'},
  lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {"branch"},
    lualine_c = {diagnostics},
    lualine_x = {'copilot','encoding','fileformat', filetype},
    lualine_y = {"progress"},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "quickfix", "man", "fugitive" },
}
end

return M
