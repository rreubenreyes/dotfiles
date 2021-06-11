" Space is my leader key
let mapleader=" "
let maplocalleader="\\"

" :Cf to open this file, :Cfr to reload this config in current env
command! Cf edit $MYVIMRC " This used to be <leader>fed
command! Cfr source $MYVIMRC " This used to be <leader>qR

" If you open a directory you'll get lf and not netrw
let g:lf_replace_netrw=1
let g:lf_map_keys=0

" Use tab to navigate through autocomplete susggestions
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" 'Next, previous [buffer]'
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Close buffers without closing the split, unless it's the last split
nnoremap <leader>bd :bp\|bd #<CR><CR>

" Go to path under cursor and open it in a new split
nnoremap <leader>gv :botright vertical wincmd f<CR>
nnoremap <leader>gs <C-w>f

" This is a spacemacs binding I am way too used to so I kept it
nnoremap <leader>w <C-w>
