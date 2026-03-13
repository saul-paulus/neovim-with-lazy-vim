## Neovim Professional Setup

Konfigurasi ini menjadikan Neovim sebagai editor profesional untuk software engineer **polyglot**: LSP lengkap, auto-format, testing terintegrasi, dan workflow harian yang konsisten.

### Fitur utama

- **Manajemen plugin modern**: `lazy.nvim` sebagai plugin manager.
- **Bahasa & LSP**:
  - JavaScript/TypeScript (frontend & backend)
  - PHP (`intelephense`)
  - Python, Go, Rust, Lua, HTML/CSS, JSON/YAML, Markdown, dan lainnya
- **Auto-completion & snippets**:
  - `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Formatting otomatis**:
  - `conform.nvim` (prettier/prettierd, black, isort, stylua, rustfmt, shfmt, pint, php-cs-fixer, dll.)
  - Format on save dengan fallback ke LSP bila perlu
- **Navigasi & struktur kode**:
  - `nvim-treesitter` + textobjects
  - `telescope.nvim` untuk fuzzy find
  - `neo-tree` sebagai file explorer, git status, dan diagnostics view
- **Testing terintegrasi**:
  - `neotest` + adapter (Jest, Python, Go, Rust)
  - Keymap standar untuk menjalankan test dari dalam Neovim
- **UX tambahan**:
  - `lualine`, `which-key`, `bufferline`, dll.

---

## Instalasi

### 1. Clone konfigurasi

Di Linux/macOS (direktori Neovim standar `~/.config/nvim`):

```bash
git clone https://github.com/saul-paulus/neovim-with-lazy-vim.git ~/.config/nvim
```

> Jika Anda clone ke folder lain, pastikan nama folder akhirnya adalah `nvim`.

### 2. Jalankan Neovim dan install plugin

1. Buka Neovim:

   ```bash
   nvim
   ```

2. Lazy akan otomatis meng-install plugin saat pertama kali dibuka.  
   Anda bisa membuka dashboard Lazy secara manual:

   ```vim
   :Lazy
   ```

Tunggu hingga semua plugin selesai ter-install, lalu restart Neovim.

---

## Workflow harian (ringkas)

### LSP & navigasi kode

- **Go to definition**: `gd`
- **Go to declaration**: `gD`
- **Implementation**: `gI`
- **References**: `gr`
- **Hover docs**: `K`
- **Rename symbol**: `<leader>lr`
- **Code action**: `<leader>la`
- **Diagnostics**:
  - Buka float di posisi cursor: `gl`
  - Next/prev diagnostic buffer: `<leader>lj` / `<leader>lk`

### Formatting

- **Format on save**: aktif secara default untuk banyak filetype.
- **Format manual**:

  ```vim
  :Format
  ```

### Testing (neotest)

Normal mode:

- Jalankan test terdekat (nearest): **`<leader>tn`**
- Jalankan test untuk file saat ini: **`<leader>tf`**
- Jalankan seluruh suite/project: **`<leader>ts`**
- Jalankan ulang test terakhir: **`<leader>tl`**
- Toggle panel summary test: **`<leader>to`**

---

## Catatan untuk PHP (Intelephense)

Konfigurasi sudah menyiapkan LSP `intelephense` melalui `mason-lspconfig`.  
Untuk mengaktifkannya:

1. Buka Neovim dan jalankan:

   ```vim
   :Mason
   ```

2. Install package **`intelephense`** dari UI Mason.
3. Restart Neovim dan buka file `.php`.

---

## Lisensi

MIT
