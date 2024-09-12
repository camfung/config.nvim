-- custom keymaps
vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '<End>', { noremap = true, silent = true })

vim.keymap.set('n', 'P', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', 'P', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', 'Y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', 'Y', '"+y', { noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>db', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', builtin.find_files)

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Line Down in Visual Mode' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Line Up in Visual Mode' })

vim.keymap.set('n', '<leader>yf', ':%y<cr>', { desc = 'yank current file to the clipboard buffer' })
vim.keymap.set('n', '<leader>df', ':%d_<cr>', { desc = 'delete file content to black hole register' })
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '🫥', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
