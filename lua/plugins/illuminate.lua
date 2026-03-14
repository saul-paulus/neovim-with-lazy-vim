return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, illuminate = pcall(require, "illuminate")
    if not ok then
      return
    end

    illuminate.configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 120,
      filetypes_denylist = {
        "neo-tree",
        "lazy",
        "mason",
        "dashboard",
        "help",
      },
      min_count_to_highlight = 2,
    })
  end,
}

