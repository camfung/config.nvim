-- custom keymaps
vim.keymap.set('n', 'H', 'g^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', 'g<End>', { noremap = true, silent = true })

vim.keymap.set('v', 'H', 'g^', { noremap = true, silent = true })
vim.keymap.set('v', 'L', 'g<End>', { noremap = true, silent = true })

vim.keymap.set('n', 'P', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', 'P', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', 'Y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', 'Y', '"+y', { noremap = true, silent = true })

vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })

vim.keymap.set('v', '<leader>p', '"_dp')

vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

vim.keymap.set('n', '<C-e>', '5<C-e>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', '5<C-y>', { noremap = true, silent = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

vim.keymap.set('n', '{', '{zz', { noremap = true, silent = true })
vim.keymap.set('n', '}', '}zz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>db', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'S', '@s', { noremap = true })

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search And Replace The Word Under The Cursor' })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', builtin.find_files)
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- Harpoon keybindings

-- Add the current file to Harpoon
vim.api.nvim_set_keymap(
  'n',
  '<leader>a',
  '<cmd>lua require("harpoon.mark").add_file()<CR>',
  { noremap = true, silent = true, desc = 'Add current file to Harpoon' }
)

-- Navigate to Harpoon file 1
vim.api.nvim_set_keymap(
  'n',
  '<leader>1',
  '<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 1' }
)

-- Navigate to Harpoon file 2
vim.api.nvim_set_keymap(
  'n',
  '<leader>2',
  '<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 2' }
)

-- Navigate to Harpoon file 3
vim.api.nvim_set_keymap(
  'n',
  '<leader>3',
  '<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 3' }
)

-- Navigate to Harpoon file 4
vim.api.nvim_set_keymap(
  'n',
  '<leader>4',
  '<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 4' }
)

-- Navigate to Harpoon file 5
vim.api.nvim_set_keymap(
  'n',
  '<leader>5',
  '<cmd>lua require("harpoon.ui").nav_file(5)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 5' }
)

-- Navigate to Harpoon file 6
vim.api.nvim_set_keymap(
  'n',
  '<leader>6',
  '<cmd>lua require("harpoon.ui").nav_file(6)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 6' }
)

-- Navigate to Harpoon file 7
vim.api.nvim_set_keymap(
  'n',
  '<leader>7',
  '<cmd>lua require("harpoon.ui").nav_file(7)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 7' }
)

-- Navigate to Harpoon file 8
vim.api.nvim_set_keymap(
  'n',
  '<leader>8',
  '<cmd>lua require("harpoon.ui").nav_file(8)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 8' }
)

-- Navigate to Harpoon file 9
vim.api.nvim_set_keymap(
  'n',
  '<leader>9',
  '<cmd>lua require("harpoon.ui").nav_file(9)<CR>',
  { noremap = true, silent = true, desc = 'Navigate to Harpoon file 9' }
)

-- Toggle Harpoon's quick menu
vim.api.nvim_set_keymap(
  'n',
  '<leader>m',
  '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { noremap = true, silent = true, desc = 'Toggle Harpoon quick menu' }
)

-- Navigate to the next Harpoon mark
vim.api.nvim_set_keymap(
  'n',
  '<Right>',
  '<cmd>lua require("harpoon.ui").nav_next()<CR>',
  { noremap = true, silent = true, desc = 'Navigate to the next Harpoon file' }
)

-- Navigate to the previous Harpoon mark
vim.api.nvim_set_keymap(
  'n',
  '<Left>',
  '<cmd>lua require("harpoon.ui").nav_prev()<CR>',
  { noremap = true, silent = true, desc = 'Navigate to the previous Harpoon file' }
)

vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Line Down in Visual Mode' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Line Up in Visual Mode' })

vim.keymap.set('n', ';', ':', { noremap = true, silent = true })
vim.keymap.set('n', ':', ';', { noremap = true, silent = false })

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

    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_a = { 'mode' },
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

require('conform').format { async = false, lsp_fallback = false }

vim.api.nvim_create_user_command('RunModule', function()
  local file = vim.fn.expand '%:p'
  local root = vim.fn.getcwd() -- assumes you're in project root
  local relative = vim.fn.fnamemodify(file, ':~:.')
  local module = relative:gsub('/', '.'):gsub('%.py$', '')
  vim.cmd('!cd ' .. root .. ' && python3 -m ' .. module)
end, {})

-- Put this in init.lua or lua/config/keymaps.lua

-- Helper function: map in all modes
local function map_all(lhs, rhs)
  local modes = { 'n', 'v', 'x', 'o' }
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
  end
end

-- Remaps
map_all('n', 'k')
map_all('j', 'n')

map_all('k', 'j')

map_all('N', 'K')
map_all('J', 'N')

map_all('K', 'J')
