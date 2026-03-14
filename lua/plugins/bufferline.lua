return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = function()
    local bufferline = require('bufferline')
    return {
      options = {
        mode = 'buffers',
        close_command = "Bdelete %d",
        right_mouse_command = "Bdelete %d",
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        separator_style = 'thin',
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'EXPLORER',
            text_align = 'left',
            separator = true,
          },
        },
        color_icons = true,
      },
    }
  end,
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
}