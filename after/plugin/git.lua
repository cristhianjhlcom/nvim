local nnoremap = require("cristhianjhl.keymap").nnoremap
local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
    return
end

gitsigns.setup {
  signs = {
    add = { text = '' },
    change = { text = '~'},
    delete = { text = '' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

nnoremap("<Leader>gs", "<CMD>Git status<CR>")
nnoremap("<Leader>ga", "<CMD>Git add <Left>")
