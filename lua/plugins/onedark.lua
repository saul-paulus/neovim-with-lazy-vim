-- for themes in this text editor
return {
  {
    "olimorris/onedarkpro.nvim", 
    lazy = false,
    name = "onedark",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme onedark")
      colors = {
        onedark = { bg = "#282C34" },
      }
    end
  }
}


