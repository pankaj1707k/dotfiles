return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]parenthen
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    require('mini.statusline').setup()
    MiniStatusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.move').setup {
      mappings = {
        left = '<C-S-h>',
        down = '<C-S-j>',
        up = '<C-S-k>',
        right = '<C-S-l>',
        line_left = '<C-S-h>',
        line_down = '<C-S-j>',
        line_up = '<C-S-k>',
        line_right = '<C-S-l>',
      },
    }
  end,
}
