local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info', 'hint' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local filetype = {
    'filetype',
    icons_enabled = true,
    icon_only = false,
}

local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { "SmiteshP/nvim-navic" }
}

function M.config()
  local navic = require("nvim-navic")
  require('lualine').setup({
    options = {
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { 'dashboard', 'lazy' },
        winbar = {},
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 
        'filename', 
        diagnostics,
        {
          function()
            return navic.get_location()
          end,
          cond = function()
            return navic.is_available()
          end,
        },
      },
      lualine_x = { diff, 'encoding', filetype },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  })
end

return M