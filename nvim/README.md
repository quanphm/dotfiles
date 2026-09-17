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

## spectre / undotree / zen-mode / mason (spec-level `keys=` in `lua/plugin-specs.lua`)

| Keys | Action |
|---|---|
| `<leader>sr` | replace in files (spectre) |
| `<leader>u` | toggle undotree (loads plugin on first press) |
| `<leader>z` | toggle zen mode (loads plugin on first press) |
| `<leader>cm` | open Mason dashboard |

## gitsigns (`lua/plugins-configs/gitsigns.lua`, buffer-local, `Gitsigns: `-prefixed)

| Keys | Action |
|---|---|
| `]c` / `[c` | next / prev hunk (falls back to diff navigation) |
| `<leader>hs` | stage hunk (works on visual selection) |
| `<leader>hr` | reset hunk (works on visual selection) |
| `<leader>hS` | stage buffer |
| `<leader>hu` | undo stage hunk |
| `<leader>hR` | reset buffer |
| `<leader>hp` | preview hunk |
| `<leader>hb` | blame line (full) |
| `<leader>hd` / `<leader>hD` | diff this / diff this against `~` |
| `ih` | select hunk (operator/visual) |

## fugitive (spec-level `keys=`, loads on first press)

| Keys | Action |
|---|---|
| `<leader>gs` | `:Git` status |
| `<leader>gc` | `:Git commit` |
| `<leader>gp` | `:Git push` |
| `<leader>gb` | `:Git blame` |

## Plugin defaults (no repo config — documented, not mapped)

- **blink** (`preset = "default"` in `plugins-configs/blink.lua`):
  `<C-space>` trigger, `<C-n>` / `<C-p>` navigate, `<C-y>` / `<CR>` accept,
  `<C-e>` cancel, `<Tab>` / `<S-Tab>` snippet jump.
- **treesitter** (`plugins-configs/nvim-treesitter.lua`): incremental selection
  with `<C-space>` (init/increment), `<C-s>` scope, `<C-bs>` decrement;
  text objects `of` / `if` function, `oc` / `ic` class; moves `]m` / `[m`,
  `]]` / `[[`, `]M` / `[M`, `][` / `[]`.
- **Comment.nvim**: `gcc` line, `gbc` block, `gc` / `gb` operator.
- **surround** (`ys` add, `ds` delete, `cs` change; bare `ds` is distinct
  from `<leader>ds` document symbols):
  | Before | Command | After |
  |---|---|---|
  | `surr*ound_words` | `ysiw)` | `(surround_words)` |
  | `surr*ound_words` | `ysiw(` | `( surround_words )` |
  | `*make strings` | `ys$"` | `"make strings"` |
  | `[delete ar*ound me!]` | `ds]` | `delete around me!` |
  | `remove <b>HTML t*ags</b>` | `dst` | `remove HTML tags` |
  | `'change quot*es'` | `cs'"` | `"change quotes"` |
  | `<b>or tag* types</b>` | `csth1<CR>` | `<h1>or tag types</h1>` |
  | `delete(functi*on calls)` | `dsf` | `function calls` |
- **mini.pairs / mini.ai**: autopairs on input; `a` / `i` text objects
  (`aa` / `ia` argument, `af` / `if` function, plus brackets/quotes/tag).
- **tmux-navigator**: `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` move across
  vim/tmux splits.

No keymaps by design: lualine, fidget, mason-lspconfig, devicons,
mini.icons, vim-repeat (all libraries or UI with command interfaces).
