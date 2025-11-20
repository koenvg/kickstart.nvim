-- Delta integration for nvim via diffview
-- Provides beautiful side-by-side diffs with syntax highlighting

return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('diffview').setup {
        enhanced_diff_hl = true, -- Better syntax highlighting
        use_icons = true,
        view = {
          default = {
            layout = 'diff2_horizontal', -- Side by side layout
            winbar_info = true,
          },
          merge_tool = {
            layout = 'diff3_horizontal',
          },
          file_history = {
            layout = 'diff2_horizontal',
          },
        },
        file_panel = {
          listing_style = 'tree',
          tree_options = {
            flatten_dirs = true,
            folder_statuses = 'only_folded',
          },
          win_config = {
            position = 'left',
            width = 35,
          },
        },
        keymaps = {
          view = {
            ['q'] = '<Cmd>DiffviewClose<CR>',
            ['<leader>q'] = '<Cmd>DiffviewClose<CR>',
          },
          file_panel = {
            ['q'] = '<Cmd>DiffviewClose<CR>',
            ['<leader>q'] = '<Cmd>DiffviewClose<CR>',
          },
        },
      }

      -- Keymaps (avoiding conflicts with existing gd)
      vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', { desc = '[D]iff [V]iew - open' })
      vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = '[D]iff [C]lose' })
      vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<CR>', { desc = '[D]iff [H]istory all' })
      vim.keymap.set('n', '<leader>df', ':DiffviewFileHistory %<CR>', { desc = '[D]iff [F]ile history' })
      vim.keymap.set('n', '<leader>dm', ':DiffviewOpen main<CR>', { desc = '[D]iff vs [M]ain branch' })
    end,
  },
}
