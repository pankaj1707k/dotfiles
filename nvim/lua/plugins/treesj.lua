return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require 'treesj'
    vim.keymap.set('n', '<leader>tt', treesj.toggle, { desc = 'Toggle split-join' })
    vim.keymap.set('n', '<leader>ts', treesj.split, { desc = 'Split object' })
    vim.keymap.set('n', '<leader>tj', treesj.join, { desc = 'Join object' })
    treesj.setup { use_default_keymaps = false }
  end,
}
