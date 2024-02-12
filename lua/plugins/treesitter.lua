-- for coloring coding which suport on language programing

return {
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    event = {"BufRead","BufReadPost", "BufNewFile" },
    dependencies = {
      -- "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "yioneko/nvim-yati",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
      "Badhi/nvim-treesitter-cpp-tools",
    },
    config = function()
      local config =  require("nvim-treesitter.configs")
      config.setup({
        ensure_installed =  { "c", "lua", "vim", "vimdoc", "query","bash","python","php","tsx","toml","typescript","markdown", "markdown_inline","html","javascript","json" },
        highlight = {enable = true},
        indent = {enable = true},
        additional_vim_regex_highlighting = false,
        context_commentstring = {
          enable = true,
          enable_autocmd = false
        },
        raibow = {
          enable = true,
          disable = {'html'},
          extended_mode = false,
          max_file_lines = nil
        },
        autotag = {enable = true},
        incremental_selection = {enable = true},
        autopairs = {enable = true}
      })
    end
  }
}
