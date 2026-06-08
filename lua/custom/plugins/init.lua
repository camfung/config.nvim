-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    lazy = true,
    cmd = 'Oil',
    keys = {
      { '<leader>o', '<cmd>Oil<cr>', desc = '[O]il file browser' },
    },
    opts = {
      default_file_explorer = false,
      columns = { 'icon', 'size' },
      skip_confirm_for_simple_edits = true,
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle diagnostics' },
      { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer diagnostics' },
    },
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff working tree' },
      { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<cr>', desc = '[G]it [D]iff last commit' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory (repo)' },
      { '<leader>gf', '<cmd>DiffviewFileHistory --follow %<cr>', desc = '[G]it history current [F]ile' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[G]it diff [C]lose' },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = { layout = 'diff3_mixed' },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thin',
        offsets = {
          { filetype = 'NvimTree', text = 'Explorer', highlight = 'Directory', separator = true },
        },
      },
    },
  },
  {
    'folke/persistence.nvim',
    lazy = false,
    opts = {},
    config = function(_, opts)
      -- What gets saved into the session file.
      vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions'
      require('persistence').setup(opts)

      -- Auto-restore the session for this directory when launching bare `nvim`
      -- (no file args, not piping from stdin).
      vim.api.nvim_create_autocmd('StdinReadPre', {
        callback = function()
          vim.g.started_with_stdin = true
        end,
      })
      vim.api.nvim_create_autocmd('VimEnter', {
        group = vim.api.nvim_create_augroup('persistence_autoload', { clear = true }),
        nested = true,
        callback = function()
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            require('persistence').load()
          end
        end,
      })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup {
        -- Your Harpoon configuration options here
      }
    end,
  },
  {
    'iruzo/matrix-nvim',
    priority = 1000,
    config = function()
      -- You can configure the matrix theme here if needed
      -- vim.g.matrix_contrast = true
      -- vim.g.matrix_borders = false
      -- vim.g.matrix_disable_background = false
      -- vim.g.matrix_italic = true
    end,
  },
  gopher = {
    -- https://github.com/olexsmir/gopher.nvim
    enable = false,
  },
}
