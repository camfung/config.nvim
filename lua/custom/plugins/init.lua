-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
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
