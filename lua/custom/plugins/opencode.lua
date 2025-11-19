return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    { 'folke/snacks.nvim', opts = { input = {}, picker = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      auto_reload = true,
    }

    vim.o.autoread = true

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map({ 'n', 'x' }, '<leader>oa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, vim.tbl_extend('force', opts, { desc = 'Ask about this' }))

    map({ 'n', 'x' }, '<leader>os', function()
      require('opencode').select()
    end, vim.tbl_extend('force', opts, { desc = 'Select prompt' }))

    map({ 'n', 'x' }, '<leader>o+', function()
      require('opencode').prompt '@this'
    end, vim.tbl_extend('force', opts, { desc = 'Add this' }))

    map('n', '<leader>ot', function()
      require('opencode').toggle()
    end, vim.tbl_extend('force', opts, { desc = 'Toggle embedded' }))

    map('n', '<leader>oc', function()
      require('opencode').command()
    end, vim.tbl_extend('force', opts, { desc = 'Select command' }))

    map('n', '<leader>on', function()
      require('opencode').command 'session_new'
    end, vim.tbl_extend('force', opts, { desc = 'New session' }))

    map('n', '<leader>oi', function()
      require('opencode').command 'session_interrupt'
    end, vim.tbl_extend('force', opts, { desc = 'Interrupt session' }))

    map('n', '<leader>oA', function()
      require('opencode').command 'agent_cycle'
    end, vim.tbl_extend('force', opts, { desc = 'Cycle selected agent' }))

    map('n', '<S-C-u>', function()
      require('opencode').command 'messages_half_page_up'
    end, vim.tbl_extend('force', opts, { desc = 'Messages half page up' }))

    map('n', '<S-C-d>', function()
      require('opencode').command 'messages_half_page_down'
    end, vim.tbl_extend('force', opts, { desc = 'Messages half page down' }))
  end,
}
