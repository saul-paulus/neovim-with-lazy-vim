local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\\\"

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation (Tab)
keymap("n", "<tab>", ":bnext<cr>", opts)
keymap("n", "<s-tab>", ":bprevious<cr>", opts)

-- Move text up and down (Alt + j/k)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Standard VS Code-style Shortcuts

-- SAVE (Ctrl + s)
keymap("n", "<C-s>", "<cmd>w<CR>", opts)
keymap("i", "<C-s>", "<Esc><cmd>w<CR>gi", opts)
keymap("v", "<C-s>", "<Esc><cmd>w<CR>gv", opts)

-- UNDO (Ctrl + z)
keymap("n", "<C-z>", "u", opts)
keymap("i", "<C-z>", "<Esc>u", opts)
keymap("v", "<C-z>", "<Esc>ugv", opts)

-- REDO (Ctrl + y)
keymap("n", "<C-y>", "<C-r>", opts)
keymap("i", "<C-y>", "<Esc><C-r>a", opts)

-- COPY (Ctrl + c)
keymap("v", "<C-c>", '"+y', opts)
keymap("n", "<C-c>", '"+yy', opts)

-- PASTE (Ctrl + v in Insert & Command modes; preserve Normal mode Visual Block <C-v>)
keymap("i", "<C-v>", "<C-r>+", opts)
keymap("v", "<C-v>", '"+p', opts)
keymap("c", "<C-v>", "<C-r>+", opts)

-- SELECT ALL (Ctrl + a)
keymap("n", "<C-a>", "ggVG", opts)
keymap("v", "<C-a>", "<Esc>ggVG", opts)

-- COMMENT (Ctrl + /) - Usually mapped to Ctrl + _ in some terminals
keymap("n", "<C-_>", "gcc", { noremap = false, silent = true })
keymap("v", "<C-_>", "gc", { noremap = false, silent = true })
keymap("x", "<C-_>", "gc", { noremap = false, silent = true })

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal Navigation
function _G.set_terminal_keymaps()
  local terminal_opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], terminal_opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], terminal_opts)
  vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], terminal_opts)
  vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], terminal_opts)
  vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], terminal_opts)
  vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], terminal_opts)
end

-- if you only want these mappings for toggle term use termopen
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
