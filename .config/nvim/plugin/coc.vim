" Use `lp` and `ln` for navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
command! LDef  execute "silent normal \<Plug>(coc-definition)"
command! LTdef execute "silent normal \<Plug>(coc-type-definition)"
command! LImpl execute "silent normal \<Plug>(coc-implementation)"
command! LRef  execute "silent normal \<Plug>(coc-references)"

" Use K to show documentation in preview window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
