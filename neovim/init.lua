local options = {
    number = true,  -- line numbers
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,  -- convert tabs to spaces
    autoindent = true,
    smartindent = true,
    wrap = false,  -- no text wrap
    swapfile = false,  -- do not create swap buffer
    backup = false,  -- do not create backup file
    hlsearch = false,  -- do not highlight search
    incsearch = true,  -- incremental search
    termguicolors = true,  -- enable terminal colors
    scrolloff = 4,  -- minimal number of lines above and below cursor
    sidescrolloff = 4,  -- minimal number of lines left and right of cursor
    cmdheight = 2,  -- increase command line height
    completeopt = "menuone,noselect",  -- show menu even for one option and force user to select
    fileencoding = "utf-8",
    hidden = true,  -- keep multiple buffers open
    mouse = "a",  -- mouse support in all modes
    showmode = false,
    title = true,  -- set title to value of titlestring
    titlestring = "%<%F%=%l/%L - nvim",
    showcmd = false,
    clipboard = "unnamedplus"  -- allow system clipboard access
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

