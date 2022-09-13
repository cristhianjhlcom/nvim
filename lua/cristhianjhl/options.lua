local os = vim.loop.os_uname().sysname

if (os == "Windows_NT") then
    local undo_dir = "c:/Users/USER/AppData/Local/nvim/undodir"
else
    local undo_dir = "~/.config/nvim/undodir"
end

local options = {
    showtabline         = 2,
    list                = true,
    listchars           = {eol = '↲', tab = '▸ ', trail = '·'},
    encoding            = "UTF-8",
    guicursor           = "",
    nu                  = true,
    relativenumber      = true,
    tabstop             = 4,
    softtabstop         = 4,
    shiftwidth          = 4,
    expandtab           = true,
    hlsearch            = false,
    incsearch           = true,
    smartindent         = true,
    wrap                = false,
    background          = "dark",
    autoindent          = true,
    errorbells          = false,
    swapfile            = false,
    backup              = false,
    undodir             = undo_dir,
    undofile            = true,
    termguicolors       = true,
    scrolloff           = 8,
    signcolumn          = "yes",
    cmdheight           = 1,
    updatetime          = 50,
    colorcolumn         = "80",
    mouse               = "a",
    completeopt         = "menu,menuone,noselect"
}

vim.g.mapleader = " "

for key in pairs(options) do
	vim.opt[key] = options[key]
end
