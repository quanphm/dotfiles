# AGENTS.md

Neovim config (lazy.nvim). Live config — edits take effect on restart. No tests or CI.

- Entrypoint: `init.lua` → `lua/{options,keymaps,commands,plugin-specs}.lua` via `require`.
  `options` must load before `keymaps` — `mapleader` is set in `options`,
  and any `<leader>` map defined before that binds to `\` instead.
- Plugin list: `lua/plugin-specs.lua` (`spec = "plugin-specs"` in lazy setup). Per-plugin setup in `lua/plugins-configs/<name>.lua` via the local `get_config(name)` helper. Each `plugins-configs/<name>.lua` module owns its setup, keymaps, and commands. Bare specs use `config = true`; `undotree` uses spec-level `keys=`.
- Pinned versions in `lazy-lock.json` — keep in sync when bumping pins.
- Format: `.stylelua.toml` (spaces, width 2, col 80). `conform.nvim` runs format-on-save with `lsp_format = "fallback"`. Chain quirks in `lua/plugins-configs/conform.lua`: JS/TS/JSON/CSS/HTML prefer `oxfmt` > `biome` > `prettierd/prettier`; `sh` lists `shellcheck` (linter, not formatter); Rust uses custom `rustfmt --edition=2024`.
- Verify: `stylua --check <file>` and `nvim --headless '+Lazy! sync' +qa` for a startup sanity check.
