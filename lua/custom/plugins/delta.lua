-- Delta integration for nvim via diffview
-- Provides beautiful side-by-side diffs with syntax highlighting

return {
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewFileHistory',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- Define keys to ensure they're always registered and trigger plugin load
    keys = {
      { '<leader>dv', '<cmd>DiffviewOpen<CR>', desc = '[D]iff [V]iew - open' },
      { '<leader>dc', '<cmd>DiffviewClose<CR>', desc = '[D]iff [C]lose' },
      { '<leader>dh', '<cmd>DiffviewFileHistory<CR>', desc = '[D]iff [H]istory all' },
      { '<leader>df', '<cmd>DiffviewFileHistory %<CR>', desc = '[D]iff [F]ile history' },
      { '<leader>dm', '<cmd>DiffviewOpen main<CR>', desc = '[D]iff vs [M]ain branch' },
    },
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
    end,
  },
}
