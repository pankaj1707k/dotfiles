return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = true,
        hide_by_name = { 'node_modules', '__pycache__', '.git', '.DS_Store' },
      },
      hijack_netrw_behavior = 'open_current',
    },
  },
}
