local nnoremap = require("cristhianjhl.keymap").nnoremap

nnoremap("<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<Leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<Leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<Leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<Leader>fw", "<CMD>lua require('telescope.builtin').grep_string()<CR>")
