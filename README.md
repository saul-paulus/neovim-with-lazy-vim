![alt text](image.png)

# Neovim Professional Setup

This configuration turns Neovim into a **professional polyglot editor** for software engineers: full LSP support, automatic formatting, integrated testing, and a consistent daily workflow.

### Key features

- **Modern plugin management**: `lazy.nvim` as the plugin manager.
- **Languages & LSPs**:
  - JavaScript/TypeScript (frontend & backend)
  - PHP (`intelephense`)
  - Python, Go, Rust, Lua, HTML/CSS, JSON/YAML, Markdown, and more
- **Auto-completion & snippets**:
  - `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Automatic formatting**:
  - `conform.nvim` (prettier/prettierd, black, isort, stylua, rustfmt, shfmt, pint, php-cs-fixer, etc.)
  - Format on save with LSP as a fallback when needed
- **Code navigation & structure**:
  - `nvim-treesitter` + textobjects
  - `telescope.nvim` for fuzzy finding
  - `neo-tree` as file explorer, git status, and diagnostics view
- **Integrated testing**:
  - `neotest` + adapters (Jest, Python, Go, Rust)
  - Standard keymaps to run tests directly from Neovim
- **UX enhancements**:
  - `lualine`, `which-key`, `bufferline`, and more

---

## Installation

### 1. Clone the configuration

On Linux/macOS (default Neovim config directory `~/.config/nvim`):

```bash
git clone https://github.com/saul-paulus/neovim-with-lazy-vim.git ~/.config/nvim
```

> If you clone into a different directory, make sure the final folder name is `nvim`.

### 2. Start Neovim and install plugins

1. Open Neovim:

   ```bash
   nvim
   ```

2. Lazy will automatically install all plugins on the first start.  
   You can open the Lazy dashboard manually with:

   ```vim
   :Lazy
   ```

Wait until all plugins are installed, then restart Neovim.

---

## Daily workflow (overview)

### LSP & code navigation

- **Go to definition**: `gd`
- **Go to declaration**: `gD`
- **Go to implementation**: `gI`
- **Find references**: `gr`
- **Hover documentation**: `K`
- **Rename symbol**: `<leader>lr`
- **Code action**: `<leader>la`
- **Diagnostics**:
  - Open diagnostic float at cursor: `gl`
  - Next/previous diagnostic in buffer: `<leader>lj` / `<leader>lk`

### Formatting

- **Format on save**: enabled by default for many filetypes.
- **Manual format**:

  ```vim
  :Format
  ```

### Testing (neotest)

Normal mode:

- Run nearest test: **`<leader>tn`**
- Run all tests in current file: **`<leader>tf`**
- Run the whole test suite/project: **`<leader>ts`**
- Re-run last test: **`<leader>tl`**
- Toggle test summary panel: **`<leader>to`**

---

## PHP (Intelephense) notes

The configuration is prepared to use the `intelephense` LSP via `mason-lspconfig`.  
To enable it:

1. Open Neovim and run:

   ```vim
   :Mason
   ```

2. Install the **`intelephense`** package from the Mason UI.
3. Restart Neovim and open a `.php` file.

---

## 📄 License

This project is open-source software licensed under the MIT License.
See the see [LICENSE](LICENSE)
