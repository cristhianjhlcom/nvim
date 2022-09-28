vim.cmd([[
  let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \}

  let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint']
    \ }

  let g:ale_fix_on_save = 0
  nmap <leader>d <Plug>(ale_fix)
]])
