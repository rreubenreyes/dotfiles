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
  Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" Editing
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'
  Plug 'craigemery/vim-autotag'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'gko/vim-coloresque', { 'for': ['css'] }
  Plug 'jiangmiao/auto-pairs' " Bracket pairs
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/vim-easy-align'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/ReplaceWithRegister'

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
""""""""""""""""""""""""""""""""""
" [ HASN'T BEEN SORTED OUT YET ] "     # unsorted
""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""

let g:javascript_plugin_jsdoc=1
highlight jsFunction cterm=italic gui=italic
filetype plugin on
set hidden
set nohlsearch
set nocompatible
set omnifunc=syntaxcomplete#Complete
set noswapfile
set nosc
syntax on
