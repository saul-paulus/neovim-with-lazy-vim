-- for themes in this text editor
local M = {
"olimorris/onedarkpro.nvim",
priority = 1000
}

-- configuration onedark
function M.config()
  vim.cmd("colorscheme onedark")

  require("onedarkpro").setup({
    colors = {
     dark_red = "require('onedarkpro.helpers').darken('red', 10, 'onedark')",
    },
    options = {
     highlight_inactive_windows = true,
     terminal_colors = false
    },
    plugins = {
     nvim_lsp = false,
     polygot = false,
     treesitter = false
    },
    styles = {
     types = "NONE",
     methods = "NONE",
     numbers = "NONE",
     strings = "NONE",
     comments = "italic",
     keywords = "bold,italic",
     constants = "NONE",
     functions = "italic",
     operators = "NONE",
     variables = "NONE",
     parameters = "NONE",
     conditionals = "italic",
     virtual_text = "NONE",
    },
    highlights = {
     Comment = { italic = true },
     Directory = { bold = true },
     ErrorMsg = { italic = true, bold = true }
    }
  })
end


return M
