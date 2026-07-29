local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto change directory to project root
local root_names = { ".git", "Makefile", "package.json", "package-lock.json", "composer.json" }
local function get_root()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then return nil end
  path = vim.fs.dirname(path)

  local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
  if root_file then
    return vim.fs.dirname(root_file)
  end
  return nil
end

local general_group = augroup("GeneralSettings", { clear = true })

autocmd("BufEnter", {
  group = general_group,
  callback = function(ctx)
    if vim.bo[ctx.buf].buftype ~= "" then return end
    local root = get_root()
    if root and root ~= vim.fn.getcwd() then
      pcall(vim.api.nvim_set_current_dir, root)
    end
  end,
})

autocmd({ "BufWinEnter" }, {
  group = general_group,
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

autocmd({ "FileType" }, {
  group = general_group,
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

autocmd({ "VimResized" }, {
  group = general_group,
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd({ "BufWinEnter" }, {
  group = general_group,
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

autocmd({ "TextYankPost" }, {
  group = general_group,
  callback = function()
    (vim.hl or vim.highlight).on_yank { higroup = "Visual", timeout = 40 }
  end,
})

autocmd({ "FileType" }, {
  group = general_group,
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd("TermClose", {
  group = general_group,
  pattern = "*lazygit*",
  callback = function()
    if package.loaded["neo-tree.sources.git_status"] then
      require("neo-tree.sources.git_status").refresh()
    end
  end,
})

-- Blade filetype detection
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
    [".*%.blade%.php%.inc"] = "blade",
  },
})
