---
tags:
  - nvim
  - treesitter
  - config-notes
---

# Treesitter — current state (2026-06-18)

## Decision

- **Leaving treesitter as-is.** No problems in daily use, so not upgrading.
- Revisit migrating to the `main` rewrite only when Neovim `0.12` ships **stable**.

## Environment

- Neovim: `v0.11.6`
- nvim-treesitter installed: `v0.10.0` (2025-05-24) — legacy `master`-branch code.
- API in use: `require('nvim-treesitter.configs').setup(opts)` (the old/master API).
- Spec lives at `init.lua:794-808`.

## Known inconsistency (cosmetic, not currently breaking use)

Three sources disagree about what's pinned:

- `init.lua:796` pins `commit = 'cb10516'` ("last stable before rewrite") — **this commit does not exist in the cloned repo**, so the pin is unresolvable.
- `lazy-lock.json` says `branch: main, commit: 42fc28ba` — but `42fc28ba` is a **master** commit (= tag `v0.10.0`), not a `main` commit.
- On disk: legacy `configs.lua` present, rewrite `nvim-treesitter/init.lua` absent → actually running frozen `master`, mislabeled as `main`.

Net: editing works fine; the pins are just internally contradictory.

## The two upstream branches

- **`master`** — FROZEN, backward-compat only, supports Nvim 0.11. No future features. This is what we run.
- **`main`** — full incompatible rewrite, all future dev. Requires **Neovim 0.12.0+ (nightly)**, `tree-sitter-cli` ≥0.26.1 (package manager, not npm), `curl`/`tar`, C compiler. No lazy-loading. Needs a full config rewrite (`require('nvim-treesitter').install{...}`, `vim.treesitter.start()` FileType autocmd, fold/indent exprs).

## If/when we want to clean up on master (without touching nvim)

- Repoint spec to `branch = 'master'`, drop the bogus `commit = 'cb10516'`.
- Sync `lazy-lock.json`, run `:TSUpdate`.
- Stable, zero config rewrite — but stays on frozen legacy.

## If/when we want the rewrite (`main`)

- First upgrade Neovim to `0.12` (stable, once released).
- Install `tree-sitter-cli`.
- Rewrite the treesitter config block to the new API.

## Notes

- `auto_install = true` is set, so opening a new filetype auto-fetches its parser on the fly.
- Treesitter `ensure_installed` (`init.lua:799`): `bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc, python, javascript, typescript, json`. Kotlin not listed.
