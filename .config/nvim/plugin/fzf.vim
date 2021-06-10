" Bindings
" In most cases, :fin will do the job when I have to open a file.
" But sometimes I don't know the project that well, so I can use fzf for
" a more discoverable way to find files.
" Aliasing fzf's :Files to :Fin because I use it like :fin
command! Fin Files
" :Buf does the same thing only it only uses the buffer list
" :Ag does the same thing only it looks into buffer content
" :Lines does the same thing only it looks into only the current buffer
" :BLines does the same thing only it looks into only open buffers

" Populate arg list on keypress
func s:fnameescape(key, val)
  return fnameescape(a:val)
endfunc

function! s:populate_arg_list(lines)
  execute 'args ' . join(map(a:lines, function('s:fnameescape')), ' ')
endfunction

function! s:populate_arg_list_append(lines)
  execute 'argadd ' . join(map(a:lines, function('s:fnameescape')), ' ')
endfunction

let g:fzf_action = {
            \ 'ctrl-l': function('s:populate_arg_list'),
            \ 'ctrl-k': function('s:populate_arg_list_append'),
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
