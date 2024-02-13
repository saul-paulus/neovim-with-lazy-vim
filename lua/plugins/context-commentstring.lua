local M = {
  "JoosepAlviste/nvim-ts-context-commentstring",
  lazy = true,
}


function M.config()
  vim.cmd("autocmd FileType * lua require'nvim-treesitter-context-commentstring'.setup()")
end

return M
