return {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
  opts = {
    spec = {
      { '<leader>c', name = '[C]ode' },
      { '<leader>d', name = '[D]ocument' },
      { '<leader>r', name = '[R]ename' },
      { '<leader>s', name = '[S]earch' },
      { '<leader>w', name = '[W]orkspace' },
    },
  },
}
