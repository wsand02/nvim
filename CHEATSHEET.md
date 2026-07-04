# Neovim Config Cheatsheet

Quick reference for everything configured in this setup. Leader key: `<space>`.

## Plugins

| Plugin | Purpose |
|---|---|
| catppuccin | Colorscheme (Mocha, transparent background) |
| nvim-telescope/telescope.nvim | Fuzzy finder (files, git files, grep, help) |
| neovim/nvim-lspconfig + mason.nvim + mason-lspconfig | LSP config & server installer |
| tpope/vim-fugitive | Git integration |
| stevearc/conform.nvim | Formatting, format-on-save |
| nvim-treesitter (+ textobjects) | Syntax highlighting, function text objects |
| ThePrimeagen/harpoon (harpoon2) | Fast file/buffer navigation |
| jiaoshijie/undotree | Visual undo history |
| hrsh7th/nvim-cmp (+ cmp-lsp/buffer/path/cmdline) | Autocompletion |
| L3MON4D3/LuaSnip + cmp_luasnip | Snippets |
| j-hui/fidget.nvim | LSP progress spinner |

**LSP servers installed:** rust_analyzer, lua_ls, gopls, vtsls (TS/JS/Vue), tailwindcss

## Keymaps

### File & buffer navigation / Harpoon
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>pv` | Open netrw file explorer |
| n | `<leader>a` | Add current file to Harpoon list |
| n | `<C-e>` | Toggle Harpoon quick menu |
| n | `<M-1>` … `<M-9>` | Jump to Harpoon file 1–9 |
| n | `<C-S-P>` | Previous Harpoon buffer |
| n | `<C-S-N>` | Next Harpoon buffer |

### Telescope
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>pf` | Find files |
| n | `<C-p>` | Find git files |
| n | `<leader>ps` | Grep (prompts for string) |
| n | `<leader>pws` | Grep word under cursor |
| n | `<leader>pWs` | Grep WORD under cursor (incl. symbols) |
| n | `<leader>vh` | Search help tags |

### LSP (bound on `LspAttach`)
| Mode | Keys | Action |
|---|---|---|
| n | `gd` | Go to definition |
| n | `K` | Hover docs |
| i | `<C-h>` | Signature help |
| n | `<leader>vws` | Workspace symbols |
| n | `<leader>vd` | Open diagnostic float |
| n | `<leader>vca` | Code action |

### Git
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>gs` | Open Fugitive |

### Formatting
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>f` | Format buffer (conform, falls back to LSP) |

### Quickfix / location list
| Mode | Keys | Action |
|---|---|---|
| n | `<C-k>` | Next quickfix item (centered) |
| n | `<C-j>` | Previous quickfix item (centered) |
| n | `<leader>k` | Next location list item (centered) |
| n | `<leader>j` | Previous location list item (centered) |

### Completion (insert mode, nvim-cmp)
| Keys | Action |
|---|---|
| `<C-p>` | Previous item |
| `<C-n>` | Next item |
| `<C-y>` | Confirm |
| `<C-Space>` | Trigger menu |

### Undo
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>u` | Toggle undotree |

### Text manipulation & movement
| Mode | Keys | Action |
|---|---|---|
| v | `K` | Move selection up 2 lines |
| v | `J` | Move selection down 1 line |
| n | `J` | Join lines, keep cursor position |
| n | `<C-d>` / `<C-u>` | Half-page down/up, centered |
| n | `n` / `N` | Next/prev search match, centered + unfolded |

### Clipboard
| Mode | Keys | Action |
|---|---|---|
| x | `<leader>p` | Paste over selection without clobbering register |
| n, v | `<leader>y` | Yank to system clipboard |
| n | `<leader>Y` | Yank line to system clipboard |
| n, v | `<leader>d` | Delete to void register (no clipboard) |

### Search & replace
| Mode | Keys | Action |
|---|---|---|
| n | `<leader>s` | `:%s/<word>/<word>/gI` prefilled with word under cursor |

### Treesitter text objects
| Mode | Keys | Action |
|---|---|---|
| x, o | `af` | Select outer function |
| x, o | `if` | Select inner function |

### Disabled / remapped
| Mode | Keys | Action |
|---|---|---|
| n | `Q` | No-op (disabled) |
| i | `<C-c>` | Same as `<Esc>` |

## Autocommands
- `LspAttach` — wires up the LSP keymaps above, buffer-local.
- `FileType` (c, cpp, lua, python, go, rust, javascript, typescript) — starts Treesitter.
- `FileType` (c, cpp, lua, javascript, typescript, html, css, json) — sets local indent to 2 spaces (expandtab, tabstop/shiftwidth/softtabstop = 2).

## General settings
- Line numbers + relative numbers on
- Default indent: tabstop/shiftwidth/softtabstop = 4, expandtab on, smartindent (2 spaces for filetypes listed above)
- No line wrap, no swapfile/backup
- Persistent undo (`~/.vim/undodir`)
- `hlsearch` off, `incsearch` on
- True color support (`termguicolors`)
- `scrolloff` 8, `signcolumn` always on, `updatetime` 50ms, `colorcolumn` 80
- netrw: no auto-split, no banner, window size 25

## Formatters (conform.nvim)
| Filetype | Formatter(s) |
|---|---|
| C/C++ | clang-format (`-style=file -fallback-style=LLVM`) |
| Lua | stylua (`--indent-type Spaces --indent-width 2`) |
| Go | goimports, gofmt |
| JavaScript/JSX, TypeScript/TSX | prettier |
| JSON/JSONC | prettier |

Format-on-save enabled, 5s timeout, falls back to LSP formatting if no formatter matches.
