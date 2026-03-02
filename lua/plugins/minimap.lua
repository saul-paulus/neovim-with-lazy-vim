return {
  "gorbit99/codewindow.nvim",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      auto_enable = true,
      exclude_filetypes = { "help", "netrw", "NvimTree", "dashboard", "lazy", "mason" },
      minimap_width = 15,
      z_index = 1,
      max_minimap_height = nil,
      active_in_terminals = true,
      window_border = "none"
    })
    codewindow.apply_default_keybinds()
    
    -- Improved global mouse scroll support for the minimap window
    local function scroll_minimap_if_hovered(amount)
      local mouse = vim.fn.getmousepos()
      local window_lib = require('codewindow.window')
      local cw_win = window_lib.get_minimap_window()
      
      if cw_win and cw_win.window and mouse.winid == cw_win.window then
        window_lib.scroll_minimap(amount)
        return true
      end
      return false
    end

    vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelUp>', function()
      if scroll_minimap_if_hovered(-1) then
        return ''
      end
      return '<ScrollWheelUp>'
    end, { expr = true, replace_keycodes = true })
    
    vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelDown>', function()
      if scroll_minimap_if_hovered(1) then
        return ''
      end
      return '<ScrollWheelDown>'
    end, { expr = true, replace_keycodes = true })
  end,
}
