return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      -- Hide 0.11 warnings (deprecated/framework)
      {
        filter = {
          any = {
            { event = "msg_show", find = "deprecated" },
            { event = "msg_show", find = "framework" },
            { event = "msg_show", find = "sign_define" },
            { event = "notify", find = "deprecated" },
            { event = "notify", find = "framework" },
          },
        },
        skip = true,
      },
      -- Hide mason-lspconfig errors about volar naming or other servers
      {
        filter = {
          event = "notify",
          any = {
            { find = "volar" },
            { find = "tailwindcss" },
            { find = "mason-lspconfig" },
          }
        },
        skip = true,
      },
      -- Silencing spawning errors for now if they are transient or noisy
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "Spawning language server" },
          }
        },
        skip = true,
      },
      -- Cleanup small messages
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}