return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    config = function()
      vim.cmd("autocmd FileType * lua require'nvim-treesitter-context-commentstring'.setup()")
    end
  }
}

