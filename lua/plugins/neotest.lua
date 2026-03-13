return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- Adapters
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
  },
  keys = {
    { "<leader>tn", desc = "Test nearest" },
    { "<leader>tf", desc = "Test current file" },
    { "<leader>ts", desc = "Test whole suite" },
    { "<leader>tl", desc = "Test last" },
    { "<leader>to", desc = "Toggle test summary" },
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("neotest-go")(),
        require("neotest-rust")(),
      },
      summary = {
        enabled = true,
        follow = true,
      },
      output = {
        enabled = true,
        open_on_run = "short",
      },
      quickfix = {
        enabled = false,
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>tn", function()
      neotest.run.run()
    end, opts)

    map("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, opts)

    map("n", "<leader>ts", function()
      neotest.run.run(vim.fn.getcwd())
    end, opts)

    map("n", "<leader>tl", function()
      neotest.run.run_last()
    end, opts)

    map("n", "<leader>to", function()
      neotest.summary.toggle()
    end, opts)
  end,
}

