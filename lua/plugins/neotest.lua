return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- Adapters
    "Vimajas/neotest-pest",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
  },
  keys = {
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Test nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test current file" },
    { "<leader>ts", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Test whole suite" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Test last" },
    { "<leader>to", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
  },
  config = function()
    local neotest = require("neotest")

    local adapters = {}
    local status_pest, pest_adapter = pcall(require, "neotest-pest")
    if status_pest then table.insert(adapters, pest_adapter) end

    local status_jest, jest_adapter = pcall(require, "neotest-jest")
    if status_jest then
      table.insert(adapters, jest_adapter({
        jestCommand = "npm test --",
        env = { CI = true },
        cwd = function() return vim.fn.getcwd() end,
      }))
    end

    local status_py, py_adapter = pcall(require, "neotest-python")
    if status_py then
      table.insert(adapters, py_adapter({ dap = { justMyCode = false } }))
    end

    local status_go, go_adapter = pcall(require, "neotest-go")
    if status_go then table.insert(adapters, go_adapter()) end

    local status_rust, rust_adapter = pcall(require, "neotest-rust")
    if status_rust then table.insert(adapters, rust_adapter()) end

    neotest.setup({
      adapters = adapters,
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
  end,
}
