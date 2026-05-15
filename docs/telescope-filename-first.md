---
tags:
  - nvim
  - telescope
  - configuration
---

# Telescope: Filename First Display

## Problem

When using Telescope `find_files` (`Ctrl+P`), long relative paths push the actual filename off-screen, making it impossible to identify files.

## Solution

Use the `filename_first` path_display option, which shows the filename before the directory path:

```
PrimaryButton.tsx ~ src/components/buttons
```

Instead of:

```
src/components/buttons/PrimaryButton.tsx
```

## Configuration

In `plugin/init.lua`, pass the option directly to `find_files`:

```lua
vim.keymap.set('n', '<C-p>', function()
  builtin.find_files { path_display = { 'filename_first' }, previewer = false }
end)
```

The `previewer = false` disables the file preview pane, giving more room for results.

### Global alternative (init.lua)

You can also set it globally in the Telescope setup defaults:

```lua
require('telescope').setup {
  defaults = {
    path_display = { 'filename_first' },
  },
}
```

**Note:** This may not apply if telescope.builtin is required before the lazy plugin config runs. Passing it directly to the picker call is more reliable.

## Other path_display Options

| Option | Example | Notes |
|---|---|---|
| `"filename_first"` | `file.tsx ~ src/components` | Best for long paths |
| `"tail"` | `file.tsx` | Filename only, no directory context |
| `"shorten"` | `s/c/b/file.tsx` | Abbreviates dirs to first char |
| `"truncate"` | `…ponents/buttons/file.tsx` | Truncates from the left |
| `"smart"` | Removes redundant segments | Can be slow on large repos |
| `"absolute"` | Full absolute path | Rarely useful |

## Requirements

- Telescope `master` branch (not `0.1.x` — `filename_first` was added April 2024)
