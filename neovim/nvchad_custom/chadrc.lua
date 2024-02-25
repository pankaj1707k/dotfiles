---@type ChadrcConfig 
local M = {}

M.ui = {
  theme = 'vscode_dark',
  statusline = {
    theme = "vscode_colored",
    overriden_modules = function (modules)
      modules[9] = (function ()
        return "%#StText# %l:%c  "
      end)()
    end,
  },
  transparency = true
}

M.plugins = "custom.plugins"

return M
