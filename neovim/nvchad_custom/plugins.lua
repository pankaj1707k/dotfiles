local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "FotiadisM/tabset.nvim",
    config = function()
      require "custom.configs.tabset"
    end
  }
}

return plugins
