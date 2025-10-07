return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Normal mode mappings
    map('n', '<leader>cc', ':CodeCompanionChat Toggle<CR>', opts) -- Toggle chat buffer
    map('n', '<leader>ca', ':CodeCompanionActions<CR>', opts) -- Open Action Palette
    map('n', '<leader>ci', ':CodeCompanion<CR>', opts) -- Inline assistant
    map('n', '<leader>cm', ':CodeCompanionCmd<CR>', opts) -- Command generator

    -- Visual mode mappings
    map('v', '<leader>ci', ':CodeCompanion<CR>', opts) -- Inline assistant on selection

    require('codecompanion').setup {
      adapters = {
        http = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-3.7-sonnet',
                  -- default = 'gpt-5',
                },
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
    }
  end,
}
