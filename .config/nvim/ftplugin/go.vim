" Organize imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')

" fmt on save
" function! s:run_gofmt()
"   execute "norm m'"
"   execute '%!gofmt'
"   execute "norm ''"
" endfunction

" autocmd BufWritePre *.go :silent call s:run_gofmt()
command! GoFmt exec '%!gofmt'
