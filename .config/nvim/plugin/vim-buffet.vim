function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=0 guibg=#AAFFE4 guifg=#000000
  hi! BuffetBuffer cterm=NONE ctermbg=0 ctermfg=15 guibg=#100E23 guifg=#cbe3e7
  hi! BuffetActiveBuffer cterm=NONE ctermbg=5 ctermfg=0 guibg=#d4bfff guifg=#000000
  hi! BuffetTab cterm=NONE ctermbg=0 ctermfg=15 guibg=#3E3859 guifg=#cbe3e7
endfunction

" vim-buffet
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
