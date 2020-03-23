" This is Reuben's Vim/NeoVim configuration. Here is a reminder on how this is organized:
"
" * Sections are separated by obnoxious jumbotron headers
" * Subsections are separated by less obnoxious horizontal rules
" * Sections have tags which are written in BEM syntax:
"
"     <category>__<main section>--<subsection>
"
" * Tags are meant to be browsed using a swiper or visual search
"
" * Have fun!
"
"""""""""""""""""""""""""
"""""""""""""""
" [ PLUGINS ] "                        # plugins
"""""""""""""""
"""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""""""""" [ SENSIBLE ] # plugins__sensible

"" Sensible defaults
  Plug 'tpope/vim-sensible'

""""""""""""""""""""""""" [ VISUAL ]   # plugins__visual

" Theme
  Plug 'haishanh/night-owl.vim'
  Plug 'NLKNguyen/papercolor-theme'

"" Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

""""""""""""""""""""""""" [ CORE ]     # plugins__core

"" Navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

"" Window Management
  Plug 'simeji/winresizer'

"" COC
  Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install()}}

"" Ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

"" Editing
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'
  Plug 'craigemery/vim-autotag'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'gko/vim-coloresque', { 'for': ['css'] }
  Plug 'jiangmiao/auto-pairs' " Bracket pairs
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/vim-peekaboo'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'Yilin-Yang/vim-markbar'
  Plug 'gcmt/taboo.vim'


"" Text Objects
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-user'

"" Visual
  Plug 'tpope/vim-vinegar'

"" Git
  Plug 'airblade/vim-gitgutter'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-fugitive'

""""""""""""""""""""""""" [ SYNTAX ]   # plugins__syntax

"" ALE
  Plug 'w0rp/ale'

"" Polyglot
  Plug 'sheerun/vim-polyglot'

"" JavaScript
  Plug 'kern/vim-es7', { 'for': ['javascript', 'typescript'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }

"" TypeScript
  Plug 'leafgarland/typescript-vim',

call plug#end()

"""""""""""""""""""""""""

""""""""""""""""
" [ KEYBINDS ] "                       # keybinds
""""""""""""""""

"""""""""""""""""""""""""

"" Leader                              # keybinds__leader
let mapleader=" "

""""""""""""""""""""""""" [ EDITING ]  # keybinds__editing
"" Tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" Mouse                               # keybinds__editing--mouse
set mouse=a

"" Alignment                           # keybinds__editing--align
""" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Buffers                             # keybinds__editing--buffers
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

""" Close buffers without closing the window
nnoremap <leader>bd :bp\|bd #<CR><CR>

"" EasyMotion                          # keybinds__editing--easymotion
nmap <leader>a <Plug>(easymotion-prefix)
"
"" VimMarkbar                          # keybinds__editing--markbar
nmap <leader>m <Plug>ToggleMarkbar
nmap <leader>mo <Plug>OpenMarkbar
nmap <leader>mc <Plug>CloseMarkbar
let g:markbar_open_position='topleft'
let g:markbar_width=70
let g:markbar_enable_peekaboo=v:false
" let g:markbar_close_after_go_to=v:false

""""""""""""""""""""""""" [ CONFIG ]   # keybinds__config

"" Reload plugins                      # keybinds__config--plugins
nnoremap <leader>qP :PlugInstall<CR>
nnoremap <leader>qrp :PlugUpdate<CR>

"" Reload config                       # keybinds__config--config
nnoremap <leader>qR :source $MYVIMRC<CR>
nnoremap <leader>fed :edit $MYVIMRC<CR>


""""""""""""""""""""""""" [ FZF ]      # keybinds__fzf

"" Files                               # keybinds__fzf--files
nnoremap <leader>ff :Files %:p:h<CR>
nnoremap <leader>fd :Files ~/dev<CR>
nnoremap <leader>fh :Files $HOME<CR>

"" Project search                      # keybinds__fzf--projects
""" Project-wide grep
nnoremap <leader>ps :Ag<CR>

""" Project-wide file search
nnoremap <leader>pf :Files<CR>

"""""""""""""""""""""""" [ SWIPER ]    # keybinds__swiper

""" Swipe all lines in the current buffer
nnoremap <leader>ss :BLines<CR>

""" Swipe all lines in all open buffers
nnoremap <leader>sS :Lines<CR>

""""""""""""""""""""""""" [ goto ]     # keybinds__goto

""" Go to tag definition
nnoremap <leader>gd <C-]>

""" Go to path under cursor
nnoremap <leader>gf gf
nnoremap <leader>gv :vertical wincmd f<CR>
nnoremap <leader>gs <C-w>f

"""""""""""""""""""""""" [ WINDOW ]    # keybinds__window

"" Leader                              # keybinds__window--leader
nnoremap <leader>w <C-w>

""" Start resizer in resize mode
nnoremap <leader>wr :WinResizerStartResize<CR>

""" Start resizer in move mode
nnoremap <leader>wm :WinResizerStartMove<CR>

"""""""""""""""""""""""""
"""""""""""
" [ ALE ] "                            # ale
"""""""""""

"" Layout                              # ale__layout
let g:ale_sign_column_always=1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🤔'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

"" Enable Airline section              # ale__airline
let g:airline#extensions#tabline#enabled=1

"" Set up fixers                       # ale__fixers
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'scss': ['prettier']
\}

let g:ale_pattern_options = {
\   '.*\.md$': {'ale_enabled': 0},
\}

""" When to fix
let g:ale_fix_on_save=1

"""""""""""""""""""""""""
""""""""""""""""""
" [ RANGER ] "                         # ranger
""""""""""""""""""
"""""""""""""""""""""""""

let g:ranger_replace_netrw=1

"""""""""""""""""""""""""
""""""""""""""""""
" [ WINRESIZER ] "                     # winresizer
""""""""""""""""""
"""""""""""""""""""""""""

""                                     # winresizer__increments let g:winresizer_vert_resize=5
let g:winresizer_horiz_resize=2

"""""""""""""""""""""""""
""""""""""""""
" [ ROOTER ] "                         # rooter
""""""""""""""
"""""""""""""""""""""""""

""" If a file isn't a Git project, make $PWD=current
let g:rooter_change_directory_for_non_project_files='current'


"""""""""""""""""""""""""
"""""""""""""
" [ THEME ] "                          # theme
"""""""""""""
"""""""""""""""""""""""""

"" Enable terminal GUI colors          # theme__gui

if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"" Enable theme                        # theme__colorscheme
syntax enable
colorscheme night-owl

"" Enable Airline theme                # theme__airline

let g:airline_theme='night_owl'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"" Enable indent guides                # theme__indent
let g:indentLine_enabled=1

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=4
let g:indent_guides_guide_size=1

"" Split bar color                     # theme__splitbar
""" 10% lighter than bg
autocmd ColorScheme * hi VertSplit guifg=#01223d ctermfg=238 gui=NONE cterm=NONE

"""""""""""""""""""""""""
""""""""""""""""""""
" [ LINE NUMBERS ] "                   # linum
""""""""""""""""""""
"""""""""""""""""""""""""

set number
set numberwidth=4
set relativenumber
au TermOpen * setlocal nonumber norelativenumber

set expandtab
set laststatus=2
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""
"""""""""""
" [ COC ] "                            # unsorted
"""""""""""
"""""""""""""""""""""""""
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)
nmap <silent> <leader>ll <Plug>(coc-format-selected)
nmap <silent> <leader>lL <Plug>(coc-format)

nmap <silent> <leader>cc <Plug>(coc-codeaction-selected)
vmap <silent> <leader>cc <Plug>(coc-codeaction-selected)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
" [ HASN'T BEEN SORTED OUT YET ] "     # unsorted
""""""""""""""""""""""""""""""""""
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:javascript_plugin_jsdoc=1
let g:netrw_fastbrowse=0
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end
highlight jsFunction cterm=italic gui=italic
filetype plugin on
set hidden
set nohlsearch
set nocompatible
set omnifunc=syntaxcomplete#Complete
set noswapfile
set nosc
syntax on
set t_ut=
set cursorline
