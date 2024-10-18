return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local theme = require 'gruvbox'
    theme.setup {
      underline = false,
      bold = false,
      overrides = {
        SignColumn = { bg = '#282828' },
      },
    }

    -- Load the colorscheme
    vim.cmd.colorscheme 'gruvbox'

    -- Configure highlights
    vim.cmd.hi 'Comment gui=none'
  end,
}
