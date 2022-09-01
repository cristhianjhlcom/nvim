local status_ok = pcall(require, "nerdtree")

if not status_ok then
  return
end

local nnoremap = require("cristhianjhl.keymap").nnoremap

nnoremap("<F3>", "<CMD>NERDTreeToggle<CR>")
nnoremap("<C-f>", "<CMD>NERDTreeFind<CR>")
