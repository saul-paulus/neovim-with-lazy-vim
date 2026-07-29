return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  config = function(_, opts)
    local luasnip = require("luasnip")
    luasnip.config.set_config(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.filetype_extend("blade", { "html", "php" })
  end,
  keys = {
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
