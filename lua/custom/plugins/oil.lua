return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<space>-', require('oil').toggle_float)

    function _G.copy_oil_path()
      local path
      if vim.bo.filetype == 'oil' then
        path = require('oil').get_current_dir():gsub('oil://', '')
      else
        path = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
      end
      vim.fn.setreg('+', path)
      print('Copied: ' .. path)
    end

    vim.keymap.set('n', '<leader>cr', _G.copy_oil_path, { desc = 'Copy relative path' })
  end,
}
