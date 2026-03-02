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
    
    -- Add global mouse scroll support for the minimap window
    vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelUp>', function()
      local win = vim.api.nvim_get_current_win()
      local cw_win = require('codewindow.window').get_minimap_window()
      
      -- Check if we are hovering over the codewindow floating window
      local mouse = vim.fn.getmousepos()
      if cw_win and mouse.winid == cw_win.window then
        require('codewindow.window').scroll_minimap(-1)
        return ''
      end
      
      -- Default behavior for normal windows
      return '<ScrollWheelUp>'
    end, { expr = true, replace_keycodes = true })
    
    vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelDown>', function()
      local win = vim.api.nvim_get_current_win()
      local cw_win = require('codewindow.window').get_minimap_window()
      
      -- Check if we are hovering over the codewindow floating window
      local mouse = vim.fn.getmousepos()
      if cw_win and mouse.winid == cw_win.window then
        require('codewindow.window').scroll_minimap(1)
        return ''
      end
      
      -- Default behavior for normal windows
      return '<ScrollWheelDown>'
    end, { expr = true, replace_keycodes = true })
  end,
}
