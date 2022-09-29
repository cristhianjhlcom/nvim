local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    return
end

toggleterm.setup {}

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set("n", "<Leader>ttv", "<CMD>ToggleTerm size=40 direction=vertical<CR>", { buffer = 0 })
vim.keymap.set("n", "<Leader>tt", "<CMD>ToggleTerm size=10 direction=horizontal<CR>", { buffer = 0 })
