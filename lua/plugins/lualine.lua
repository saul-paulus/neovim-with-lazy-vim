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
}

function M.config()
  require('lualine').setup({
    options = {
      theme = 'vscode',
      globalstatus = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'alpha', 'dashboard' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename', diagnostics },
      lualine_x = { diff, 'encoding', filetype },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  })
end

return M