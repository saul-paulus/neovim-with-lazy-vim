return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufWinEnter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    vim.g.skip_ts_context_commentstring_module = true
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua', 'javascript', 'typescript', 'tsx', 'html', 'css', 'json', 'yaml', 'bash', 'python',
        'markdown', 'markdown_inline', 'vue', 'php', 'http', 'json5', 'prisma', 'blade'
      },
      ignore_install = { 'phpdoc' }, 
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['at'] = '@class.outer',
            ['it'] = '@class.inner',
          },
        },
      },
    })
  end
}