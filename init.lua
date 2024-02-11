vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "olimorris/onedarkpro.nvim", 
    priority = 1000,
  },
  {  
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate'
  }
}
local opts = {}

require("lazy").setup(plugins, opts)
require("onedarkpro").setup({
  colors = {
    onedark = { bg = "#282C34" },
  }
})
local builtin = require("telescope.builtin")
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed =  { "c", "lua", "vim", "vimdoc", "query","bash","python","php","tsx","toml","typescript","markdown", "markdown_inline","html","javascript","json" },
  highlight = {enable = true},
  indent = {enable = true},
  additional_vim_regex_highlighting = false,
})

vim.keymap.set('n', '<C-f>',builtin.find_files,{})
vim.keymap.set('n', '<C-l>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.cmd("colorscheme onedark")




