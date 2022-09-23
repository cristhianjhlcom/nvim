local os = vim.loop.os_uname().sysname

if (os == "Windows_NT") then
    local undo_dir = "c:/Users/USER/AppData/Local/nvim/undodir"
else
    local undo_dir = "~/.config/nvim/undodir"
end

local options = {
    showtabline         = 2,
    title               = true,
    clipboard           = "unnamedplus",
    showmode            = false,
    conceallevel        = 0,
    ignorecase          = true,
    pumheight           = 10,
    smartcase           = true,
    splitbelow          = true,
    splitright          = true,
    writebackup         = false,
    list                = true,
    cursorline          = true,
    sidescrolloff       = 8,
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
vim.opt.shortmess:append "c"

for key in pairs(options) do
	vim.opt[key] = options[key]
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
