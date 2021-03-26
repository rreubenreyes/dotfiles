function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=0 guibg=#AAFFE4 guifg=#000000
  hi! BuffetBuffer cterm=NONE ctermbg=0 ctermfg=15 guibg=#100E23 guifg=#cbe3e7
  hi! BuffetActiveBuffer cterm=NONE ctermbg=5 ctermfg=0 guibg=#d4bfff guifg=#000000
  hi! BuffetTab cterm=NONE ctermbg=0 ctermfg=15 guibg=#3E3859 guifg=#cbe3e7
endfunction

" Plugin manager is vim-plugged
call plug#begin('~/.local/share/nvim/plugged')

" Make default vim more usable
Plug 'tpope/vim-sensible'

" Theme
Plug 'embark-theme/vim'

" Fancy statusline, most 'show metadata in the statusline' plugins look nicer now
Plug 'bagrat/vim-buffet'
Plug 'itchyny/lightline.vim'

" Use external fzf for file navigation
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" IDE madness I guess
Plug 'pechorin/any-jump.vim'

" Mostly linting and language server support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use lf for more visual file navigation, also preview buffers
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'rbgrouleff/bclose.vim'
Plug 'voldikss/vim-floaterm'

" Because I'm too lazy to type "_di(F(p
Plug 'vim-scripts/ReplaceWithRegister'

" taBs vS sPaCeS
Plug 'editorconfig/editorconfig-vim'

" CSS color previews
Plug 'norcalli/nvim-colorizer.lua', { 'for': ['css', 'scss'] }

" Automatically spit out closing brackets/quotations/etc
Plug 'jiangmiao/auto-pairs'

" I'm too lazy to type out the whole column command
Plug 'godlygeek/tabular'

" Expand DOM tags using convenient shorthand
Plug 'mattn/emmet-vim'

" Case-permutation-sensitive ex
Plug 'tpope/vim-abolish'

" Commenting is now a vim action
Plug 'tpope/vim-commentary'

" Repeat custom commands with .
Plug 'tpope/vim-repeat'

" More text object options for surrounding regions
Plug 'tpope/vim-surround'

" 'Paired' bindings for a lot of togglable things
Plug 'tpope/vim-unimpaired'

" 99.999999% of the time my workflow involves Git
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'

" All syntax highlighting stuff
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'md'] }
Plug 'hashivim/vim-terraform', { 'for': ['terraform'] }
Plug 'google/vim-jsonnet'

" Async linting engine
Plug 'w0rp/ale'

" Automatic tag generation
Plug 'ludovicchabant/vim-gutentags'

" Direnv
Plug 'direnv/direnv.vim'
Plug 'moll/vim-bbye'

call plug#end()

" Space is my leader key
let mapleader=" "
let maplocalleader="\\"

" :Cf to open this file, :Cfr to reload this config in current env
command! Cf edit $MYVIMRC " This used to be <leader>fed
command! Cfr source $MYVIMRC " This used to be <leader>qR

" If you open a directory you'll get lf and not netrw
let g:lf_replace_netrw=1
let g:lf_map_keys=0

" AnyJump
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

" Use tab to navigate through autocomplete susggestions
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" I'm not leet hacker enough so I still use the mouse
set mouse=a

" 'Next, previous [buffer]'
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Close buffers without closing the split, unless it's the last split
nnoremap <leader>bd :bp\|bd #<CR><CR>

" In most cases, :fin will do the job when I have to open a file.
" But sometimes I don't know the project that well, so I can use fzf for
" a more discoverable way to find files.
" Aliasing fzf's :Files to :Fin because I use it like :fin
command! Fin Files
" :Buf does the same thing only it only uses the buffer list
" :Ag does the same thing only it looks into buffer content
" :Lines does the same thing only it looks into only the current buffer
" :BLines does the same thing only it looks into only open buffers

" Go to path under cursor and open it in a new split
nnoremap <leader>gv :botright vertical wincmd f<CR>
nnoremap <leader>gs <C-w>f

" This is a spacemacs binding I am way too used to so I kept it
nnoremap <leader>w <C-w>

" Open splts to the right/bottom
set splitbelow
set splitright

" Put linting information in the gutter
let g:ale_sign_column_always=1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '?'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Use eslint for JS
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['pylint'],
            \}

let g:ale_fixers = {
            \    'javascript': ['eslint'],
            \    'scss': ['prettier']
            \}

let g:ale_pattern_options = {
            \   '.*\.md$': {'ale_enabled': 0},
            \}

" Fix files on save
let g:ale_fix_on_save=1

" If a file isn't a Git project, make $PWD=current
let g:rooter_change_directory_for_non_project_files='current'

if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:embark_terminal_italics=1
colorscheme embark
set laststatus=2 " Always render the status line

" Miscellaneous editing preferences
set number                                       " Use line numbers
set numberwidth=4                                " Use 4 characters for the line gutter
set relativenumber                               " Use relative numbering
set expandtab                                    " Use spaces instead of tabs. editorconfig might overwrite this
set tabstop=4                                    " Indentation width is 4 characters
set shiftwidth=4                                 " same
au TermOpen * setlocal nonumber norelativenumber " Do not use line numbers in terminal mode

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumn/gutter
set signcolumn=yes

" COC settings
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

" More defaults
filetype plugin on
set hidden     " Do not close buffers when they're not displayed
set nohlsearch " Search highlighting is off by default
set nocompatible
set omnifunc=syntaxcomplete#Complete
set noswapfile " Swap files are a hassle
set cursorline " I actually like having a cursorline
syntax on

" Don't break colors when using vim in tmux
set t_ut=

" Let find automatically wildcard match the current directory
set wildignore+=**/node_modules/**

" Inherit terminal background colors
hi Normal guibg=NONE ctermbg=NONE

set cmdheight=2

set nofoldenable
set clipboard=unnamed

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

let g:lightline = {
      \ 'colorscheme': 'embark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'enable': {
      \     'tabline': 0
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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

" Floaterm
nnoremap  <silent>  <F7>   :FloatermNew<CR>
tnoremap  <silent>  <F7>   <C-\><C-n>:FloatermNew<CR>
nnoremap  <silent>  <F8>   :FloatermPrev<CR>
tnoremap  <silent>  <F8>   <C-\><C-n>:FloatermPrev<CR>
nnoremap  <silent>  <F9>   :FloatermNext<CR>
tnoremap  <silent>  <F9>   <C-\><C-n>:FloatermNext<CR>
nnoremap  <silent>  <F12>  :FloatermToggle<CR>
tnoremap  <silent>  <F12>  <C-\><C-n>:FloatermToggle<CR>

augroup jsonnet_ft
  au!
  autocmd BufNewFile,BufRead *.jsonnet.TEMPLATE   set syntax=jsonnet
augroup END

command! JsonnetFmt 1,$:!jsonnetfmt %
let g:floaterm_shell='fish'
