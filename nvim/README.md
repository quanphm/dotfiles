# nvim config — keymaps

Leader is `Space` (`lua/options.lua`). Sources: `lua/keymaps.lua` for globals,
`lua/plugins-configs/<name>.lua` for plugin keys, plus two spec-level `keys=`
entries in `lua/plugin-specs.lua` (spectre, undotree).

## Global (`lua/keymaps.lua`)

### Motion / editing remaps

| Keys | Mode | Action |
|---|---|---|
| `j` / `k` | normal | `gj` / `gk` when no count (wrapped-line aware) |
| `J` / `K` | visual | move selection down / up |
| `H` / `L` | normal | `^` / `$` |
| `J` | normal | join lines, keep cursor |
| `<C-d>` / `<C-u>` | normal | scroll + center |
| `n` / `N` | normal | next / prev match + center |
| `q` | normal | close all floating windows (shadows macro record) |
| `nl` | normal | new line at end of file |
| `x`, `dd`, `<leader>d` | normal/visual | delete to black hole (no yank) |
| `<leader>p` | visual | paste over selection without yanking it |
| `,` `.` `!` `?` `;` | insert | undo breakpoints |

### Windows / buffers / quit

| Keys | Action |
|---|---|
| `<leader>w_` | split horizontally |
| `<leader>w\|` | split vertically |
| `<leader>wx` | close current split |
| `<Space>bd` | force-delete buffer |
| `<C-q>` | force quit |

### Clipboard / search / misc

| Keys | Action |
|---|---|
| `<leader>y` / `<leader>Y` | yank to system clipboard |
| `gw` | search word under cursor |
| `<leader>s` | substitute word under cursor in file |
| `\cf` / `\cd` | copy file path / directory path to clipboard |
| `<C-c>` | escape insert mode |
| `<leader>l` | open Lazy dashboard |

## fzf-lua (`lua/plugins-configs/fzf.lua`)

| Keys | Action |
|---|---|
| `<leader>sf` | search files |
| `<leader>?` | recently opened files |
| `<leader><Space>` | open buffers |
| `<leader>sh` | help tags |
| `<leader>sw` | grep word under cursor |
| `<leader>sg` | live grep |
| `<leader>sk` | search keymaps |
| `gd` / `gr` / `gi` | goto definition / references / implementation |
| `<leader>ds` | document symbols (wrapped preview) |
| `<leader>cd` | document diagnostics (wrapped) |
| `<leader>ca` | code actions (cursor-relative popup, no preview) |
| `<leader>r` | resume last picker |

Inside the picker: `<C-d>` / `<C-u>` page preview, `ctrl-q` select-all + accept.

## LSP native (`lua/plugins-configs/lsp.lua`, `LSP: `-prefixed)

| Keys | Action |
|---|---|
| `<leader>rn` | rename |
| `gD` | goto declaration |
| `<leader>D` | type definition |
| `K` | hover |
| `<C-s>` | signature help |
| `[d` / `]d` | prev / next diagnostic |
| `<leader>e` | line diagnostics in float |

## conform (`lua/plugins-configs/conform.lua`)

| Keys / Cmd | Action |
|---|---|
| `ff` | format buffer (async, 1s timeout, LSP fallback) |
| `:FormatDisable[!]` | disable autoformat (global, or buffer with `!`) |
| `:FormatEnable` | re-enable autoformat |

## oil (`lua/plugins-configs/oil.lua`)

| Keys | Action |
|---|---|
| `<leader>pv` | open directory listing |

Buffer keys (defaults off): `<CR>` select, `<C-v>` / `<C-s>` / `<C-t>`
vsplit / split / tab, `<C-p>` preview, `<C-c>` close, `<C-r>` refresh,
`-` parent, `_` cwd, `` ` `` cd, `~` tcd, `g.` toggle hidden, `g?` help.

## harpoon (`lua/plugins-configs/harpoon.lua`)

| Keys | Action |
|---|---|
| `<leader>a` | add file |
| `<leader>n` | toggle quick menu |
| `<C-n>` / `<C-m>` | go to file 1 / 2 |

## trouble (`lua/plugins-configs/trouble.lua`)

| Keys | Action |
|---|---|
| `<leader>q` | diagnostics list |
| `<leader>xq` | quickfix list |

## ufo folds (`lua/plugins-configs/ufo.lua`)

| Keys | Action |
|---|---|
| `zR` / `zM` | open / close all folds |
| `zr` / `zm` | open / close folds by kind |
| `<leader>K` | peek folded lines (falls back to hover) |

## spectre / undotree (spec-level `keys=` in `lua/plugin-specs.lua`)

| Keys | Action |
|---|---|
| `<leader>sr` | replace in files (spectre) |
| `<leader>u` | toggle undotree (loads plugin on first press) |

No custom keymaps: gitsigns, lualine, blink, treesitter, surround,
mini.pairs/ai, comment, fugitive, tmux-navigator, repeat, zen-mode,
fidget, mason, devicons, mini.icons, spectre setup itself.
