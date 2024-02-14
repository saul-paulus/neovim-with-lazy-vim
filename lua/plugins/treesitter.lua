-- for color in programing editor (Syntax higlight) 

local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  build = "TSUpdate",
  dependencies =
  {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  },
}

function M.config()
  local configs = require("nvim-treesitter.configs")
  configs.setup {
    -- Add a language of your choice
    ensure_installed = {"cpp", "python","html", "lua", "java", "javascript","php", "markdown", "markdown_inline", "bash"},
    sync_install = false,
    ignore_install = { "" },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    auto_install = true,
    autopairs = { enable = true },
    indent = { enable = true, disable = { "yaml","css" } },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      }
    }
  }
end

return M
