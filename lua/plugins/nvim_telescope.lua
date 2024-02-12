-- for search file in directory

return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-f>',builtin.find_files,{})
      vim.keymap.set('n', '<C-l>', builtin.live_grep, {})
      vim.keymap.set('n', '<C-b>', builtin.buffers, {})
    end
    }
}
