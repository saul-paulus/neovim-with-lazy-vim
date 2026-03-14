![alt text](image.png)

# Neovim Professional Setup

This configuration turns Neovim into a **professional polyglot editor** for software engineers: full LSP support, automatic formatting, integrated testing, and a consistent daily workflow.

### Key features

- **Modern plugin management**: `lazy.nvim` as the plugin manager.
- **Languages & LSPs**: TypeScript, PHP, Python, Go, Rust, Lua, TailwindCSS, etc.
- **Auto-completion**: `nvim-cmp` with AI-friendly support (Copilot/Tabnine ready).
- **Automatic formatting**: `conform.nvim` for consistent style.
- **Fast Navigation**: `flash.nvim` for jumping and `oil.nvim` for file editing.
- **Integrated testing**: `neotest` for running tests directly.

---

## Installation

### 1. Clone the configuration
```bash
git clone https://github.com/saul-paulus/neovim-with-lazy-vim.git ~/.config/nvim
```

### 2. Start Neovim
Open Neovim and wait for `lazy.nvim` to install all plugins. Restart after completion.

---

## ⌨️ Keymaps Documentation

Berikut adalah rangkuman perintah keyboard untuk workflow harian Anda.

### 🛠️ General & Editor
| Tombol | Perintah Vim | Deskripsi |
| :--- | :--- | :--- |
| **`<leader>`** | `<Space>` | **Leader Key Utaman** |
| `Ctrl + s` | `:w` | Simpan file |
| `Ctrl + z` | `u` | Undo (Batal) |
| `Ctrl + y` | `Ctrl + r` | Redo (Kembali) |
| `Ctrl + a` | `ggVG` | Pilih Semua Teks |
| `Ctrl + f` | `/` | Cari Teks (Search) |
| `Ctrl + /` | `gcc` | Toggle Komentar (Line) |
| `Alt + j` | - | Geser baris ke Bawah |
| `Alt + k` | - | Geser baris ke Atas |
| `<leader>h` | `:nohlsearch` | Hilangkan highlight pencarian |
| `<leader>q` | `:confirm q` | Keluar dari Neovim |

### 🪟 Windows & Buffers
| Tombol | Perintah | Deskripsi |
| :--- | :--- | :--- |
| `<leader>v` | `:vsplit` | Split jendela secara Vertikal |
| `Ctrl + h` | - | Pindah ke jendela Kiri |
| `Ctrl + j` | - | Pindah ke jendela Bawah |
| `Ctrl + k` | - | Pindah ke jendela Atas |
| `Ctrl + l` | - | Pindah ke jendela Kanan |
| `<Tab>` | `:bnext` | Pindah ke Buffer Berikutnya |
| `Shift + <Tab>` | `:bprevious` | Pindah ke Buffer Sebelumnya |
| `<leader>c` | `:bd` | Menutup Buffer/Tab saat ini |

### 🧠 LSP & Code Intelligence
| Tombol | Aksi | Deskripsi |
| :--- | :--- | :--- |
| `gd` | Definition | Ke definisi fungsi/variabel |
| `gD` | Declaration | Ke deklarasi fungsi/variabel |
| `gI` | Implementation | Ke implementasi class/interface |
| `gr` | References | Cari semua referensi kode |
| `K` | Hover | Tampilkan dokumentasi fungsi |
| `gl` | Diagnostic | Lihat error di baris saat ini |
| `<leader>lr` | Rename | Ubah nama variabel secara global |
| `<leader>la` | Code Action | Saran perbaikan kode (Quick fix) |
| `<leader>lf` | Format | Merapikan kode (Manual) |
| `<leader>lj` | Next Diagnostic | Lompat ke error berikutnya |
| `<leader>lk` | Prev Diagnostic | Lompat ke error sebelumnya |

### 🔍 Searching & Navigation
| Tombol | Plugin | Aksi |
| :--- | :--- | :--- |
| `<leader>ff` | **Telescope** | Cari File berdasarkan nama |
| `<leader>fg` | **Telescope** | Cari Teks dalam seluruh proyek |
| `<leader>fb` | **Telescope** | Cari Buffer yang sedang terbuka |
| `-` | **Oil.nvim** | Buka editor file system (Edit folder) |
| `\` | **Neo-tree** | Toggle sidebar file explorer |
| `s` | **Flash.nvim** | Lompat cepat ke teks manapun |
| `<leader>xx` | **Trouble** | Buka daftar error/diagnostik |
| `<leader>cs` | **Trouble** | Buka struktur symbols (outline) |

### 🧪 Testing (Neotest)
| Tombol | Aksi | Deskripsi |
| :--- | :--- | :--- |
| `<leader>tn` | Test Nearest | Jalankan tes terdekat |
| `<leader>tf` | Test File | Jalankan semua tes di file ini |
| `<leader>ts` | Test Suite | Jalankan seluruh suite tes |
| `<leader>to` | Toggle Summary | Buka panel ringkasan tes |

### 🖥️ Tabs & Terminal
| Tombol | Aksi | Deskripsi |
| :--- | :--- | :--- |
| `<leader>;` | New Terminal | Buka Terminal di Tab baru |
| `<leader>an` | New Tab | Buat Tab kosong baru |
| `<leader>ao` | Only Tab | Tutup semua tab kecuali ini |

---

## PHP (Intelephense)
Install menggunakan `:Mason`, pilih `intelephense`. Konfigurasi sudah dioptimalkan untuk pengembangan PHP modern.

## 📄 License
MIT License - [LICENSE](LICENSE)
