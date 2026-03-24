local M = {}

M.get_tab = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local file_path = vim.api.nvim_buf_get_name(bufnr)
  if file_path == "" then
    return ""
  end

  local filename = vim.fn.fnamemodify(file_path, ":t")
  local extension = vim.fn.fnamemodify(file_path, ":e")
  local icon, _ = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

  local modified = vim.api.nvim_buf_get_option(bufnr, "modified") and " ● " or ""
  
  -- Component for the tab-like filename
  local close_icon = " "
  local tab = string.format(" %s %s%s %s", icon or "", filename, modified, close_icon)
  
  return tab
end

M.close_buffer = function()
  local status_ok, bufdelete = pcall(require, "bufdelete")
  if status_ok then
    bufdelete.bufdelete(0, false)
  else
    vim.cmd("Bdelete")
  end
end

return M
