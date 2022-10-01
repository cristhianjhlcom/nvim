local nnoremap = require("cristhianjhl.keymap").nnoremap
local inoremap = require("cristhianjhl.keymap").inoremap
local vnoremap = require("cristhianjhl.keymap").vnoremap
local xnoremap = require("cristhianjhl.keymap").xnoremap

local opts = {silent = true}

vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

nnoremap("<Leader>pv", "<CMD>Ex<CR>")

-- PHP CS Fixer
nnoremap("<Leader>pcd", "<CMD>call PhpCsFixerFixDirectory()<CR>", opts)
nnoremap("<Leader>pcf", "<CMD>call PhpCsFixerFixFile()<CR>", opts)

-- NORMAL
-- Better Windows Navigation.
nnoremap("<C-h>", "<C-w>h", opts)
nnoremap("<C-j>", "<C-w>j", opts)
nnoremap("<C-k>", "<C-w>k", opts)
nnoremap("<C-l>", "<C-w>l", opts)
vnoremap("<C-c>", '"*y', opts)

-- Save File.
nnoremap("<C-s>", ":w <CR>")
inoremap("<C-s>", "<ESC>:w <CR>a")

-- Toggle Text Wrap.
nnoremap("<A-z>", "<CMD>set wrap<CR>")

-- Resize with Arrows.
nnoremap("<C-Up>", ":resize -2<cr>", opts)
nnoremap("<C-Down>", ":resize +2<cr>", opts)
nnoremap("<C-Left>", ":vertical resize -2<cr>", opts)
nnoremap("<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate Buffers.
nnoremap("<S-l>", ":bnext<CR>", opts)
nnoremap("<S-h>", ":bprevious<CR>", opts)

-- Close Buffers.
nnoremap("<S-q>", "<CMD>bdelete!<CR>", opts)

-- VISUAL
-- Better Paste.
vnoremap("p", '"_dP', opts)

-- TABS
nnoremap("<Leader>te", ":tabedit<CR>")
nnoremap("<Leader>tc", ":tabclose<CR>")
nnoremap("<C-l>", ":tabnext<CR>")
nnoremap("<C-h>", ":tabprevious<CR>")

-- Stay in Indent mode.
vnoremap("<", "<gv", opts)
vnoremap(">", ">gv", opts)

-- Move text up and down
vnoremap("<A-j>", ":m .+1<CR>==", opts)
vnoremap("<A-k>", ":m .-2<CR>==", opts)
vnoremap("p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
xnoremap("J", ":move '>+1<CR>gv-gv", opts)
xnoremap("K", ":move '<-2<CR>gv-gv", opts)
xnoremap("<A-j>", ":move '>+1<CR>gv-gv", opts)
xnoremap("<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Open NeoVim Config File
nnoremap("<Leader>ev", "<CMD>e<SPACE>c:/Users/Cristhian/AppData/Local/nvim/<CR>")
nnoremap("<Leader>tt", "<CMD>NERDTermToggle<CR>")

-- Entel Scripts for Development
nnoremap("<Leader>etag", ":e C:\\projects\\repo_atg\\entel-postpay\\atg\\Design\\base\\react\\tags<CR>")
nnoremap("<Leader>ec", ":!powershell gulp react --app= --dry<Left><Left><Left><Left><Left><Left>")
