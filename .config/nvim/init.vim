"" 
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

"" Oh god
  Plug 'takac/vim-hardtime'
  let g:hardtime_default_on=1

""""""""""""""""""""""""" [ SENSIBLE ] # plugins__sensible

"" Theme
  Plug 'tpope/vim-sensible'

""""""""""""""""""""""""" [ VISUAL ]   # plugins__visual

"" Theme
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

"" Editing
  Plug 'Shougo/deoplete.nvim'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'
  Plug 'craigemery/vim-autotag' 
  Plug 'editorconfig/editorconfig-vim'
  Plug 'gko/vim-coloresque'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/ReplaceWithRegister'

"" Text Objects
  Plug 'Julian/vim-textobj-variable-segment'
  Plug 'glts/vim-textobj-comment'
  Plug 'jceb/vim-textobj-uri'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-user'
  Plug 'vimtaku/vim-textobj-keyvalue'

"" Visual
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"" Git
  Plug 'airblade/vim-gitgutter'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-fugitive'
  Plug 'Xuyuanp/nerdtree-git-plugin'

""""""""""""""""""""""""" [ SYNTAX ]   # plugins__syntax

"" ALE
  Plug 'w0rp/ale'

"" Polyglot
  Plug 'sheerun/vim-polyglot'

"" JavaScript
  Plug 'kern/vim-es7'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'

"" TypeScript
  Plug 'leafgarland/typescript-vim'



""""""""""""""""""""""""" [ NOTES ]    # plugins__vimwiki

"" VimWiki
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }


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
""" Buffer list
nnoremap <leader>bb :Buffers<CR>

""" Close buffers without closing the window
nnoremap <leader>bd :bp\|bd #<CR><CR>

""" Buffer navigation
nnoremap <leader>b$ :blast<CR>
nnoremap <leader>b0 :bfirst<CR>
nnoremap <leader>bB :b 
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

"" EasyMotion                          # keybinds__editing--easymotion
nmap <leader>a <Plug>(easymotion-prefix)

"" Folding                             # keybinds__editing--folding
nnoremap <leader>eA zA
nnoremap <leader>ea za
nnoremap <leader>ec zc
nnoremap <leader>eo zo

"" Opening files                       # keybinds__editing--files
nnoremap <leader> :vertical wincmd f<CR>
nnoremap <leader>os wincmd f<CR>

""""""""""""""""""""""""" [ CONFIG ]   # keybinds__config

"" Reload plugins                      # keybinds__config--plugins
nnoremap <leader>qP :PlugInstall<CR> 
nnoremap <leader>qrp :PlugUpdate<CR> 

"" Reload config                       # keybinds__config--config
nnoremap <leader>qR :source $MYVIMRC<CR> 
nnoremap <leader>fed :edit $MYVIMRC<CR> 


""""""""""""""""""""""""" [ LINTING ]  # keybinds__linting

"" Linting                             # keybinds__linting--ale
nnoremap <leader>ev :ALEInfo<CR>

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

"" Colors/Themes                       # keybinds__fzf--colors
""" List all color schemes
nnoremap <leader>Tc :Colors<CR> 

""""""""""""""""""""""""" [ TERMINAL ] # keybinds__terminal

""" Open terminal in vsplit
nnoremap <leader>xt :vs\|te<CR>

""" Open terminal in split
nnoremap <leader>xs :split\|te<CR>

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


""""""""""""""""""""""""" [ VIMWIKI ]  # keybinds__vimwiki

"" Global mappings
nmap ,d <Plug>VimwikiMakeDiaryNote
nmap ,dm <Plug>VimwikiMakeTomorrowDiaryNote
nmap ,dt <Plug>VimwikiTabMakeDiaryNote
nmap ,dy <Plug>VimwikiMakeYesterdayDiaryNote
nmap ,i <Plug>VimwikiDiaryIndex
nmap ,t <Plug>VimwikiTabIndex
nmap ,w <Plug>VimwikiIndex
nmap ,wq <Plug>VimwikiUISelect

"" Local mappings
nmap ,dd <Plug>VimwikiDeleteLink
nmap ,rr <Plug>VimwikiRenameLink
nmap ,wc <Plug>Vimwiki2HTML
nmap ,wcc <Plug>Vimwiki2HTMLBrowse
nmap ,wcr <Plug>VimwikiDiaryGenerateLinks
nmap ,ws <Plug>VimwikiSplitLink
nmap ,wt <Plug>VimwikiTabnewLink
nmap ,wv <Plug>VimwikiVSplitLink

"" Enable folding                      # keybinds__vimwiki--folding
let g:vimwiki_folding='expr'  

"" Dates                               # keybinds__vimwiki--dates
""" Place a date in italics on the line after the cursor
nnoremap ,. :r!date<CR>yss_yss>k

""" Place a date on the line after the cursor
nnoremap ,! :r!date<CR>kyss>k

"""""""""""""""""""""""" [ WINDOW ]    # keybinds__window

"" Leader                              # keybinds__window--leader
nnoremap <leader>w <C-w>

""" Switch window focus
nnoremap <leader><Tab> <C-w>w

""" Open windows list
nnoremap <leader>ww :Windows<CR>

""" Splits
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

""" Start resizer in resize mode
nnoremap <leader>wr :WinResizerStartResize<CR>

""" Start resizer in focus mode
nnoremap <leader>wf :WinResizerStartFocus<CR>

""" Start resizer in move mode
nnoremap <leader>wm :WinResizerStartMove<CR>

"""""""""""""""""""""""" [ NERDTREE ]  # keybinds__nerdtree
"" Focus NERDTree window
nnoremap <leader>0 :NERDTreeFocus<CR>

"" Toggle NERDTree window
nnoremap <leader>tt :NERDTreeToggle<CR>

"" Refresh NERDTree to current directory
nnoremap <leader>tr :NERDTree<CR>

"" Wait for an arg, then close that tab
nnoremap <leader>tc :tabclose 

"" Close the current tab
nnoremap <leader>tC :tabclose<CR> 

"" Escape in terminal mode actually escapes terminal mode
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""" 
""""""""""" 
" [ ALE ] "                            # ale
""""""""""" 

"" Layout                              # ale__layout
let g:ale_sign_column_always=1

"" Enable Airline section              # ale__airline
let g:airline#extnsions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1

"" Set up fixers                       # ale__fixers
let b:ale_fixers=['prettier', 'eslint', 'prettier-eslint']

""" When to fix 
let b:ale_fix_on_save=1
let g:ale_open_list=1
let g:ale_keep_list_window_open=1

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
""""""""""""""" 
" [ VIMWIKI ] "                        # vimwiki
""""""""""""""" 
""""""""""""""""""""""""" 

"" Set VimWiki root                    # vimwiki__root
let g:vimwiki_list = [{'path': '$HOME/Dropbox/md', 'syntax': 'markdown', 'ext': '.md'}]

"" Folding mode                        # vimwiki__folding
let g:rooter_change_directory_for_non_project_files='current'

""""""""""""""""""""""""" 
""""""""""""""" 
" [ DEOPLETE ] "                        # deoplete
""""""""""""""" 
""""""""""""""""""""""""" 

"" Deoplete
  let g:deoplete#enable_at_startup=1

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

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"" Split bar color                     # theme__splitbar
""" 10% lighter than bg
autocmd ColorScheme * hi VertSplit guifg=#01223d ctermfg=238 gui=NONE cterm=NONE

""""""""""""""""""""""""" 
""""""""""""""""""""
" [ LINE NUMBERS ] "                   # linum
""""""""""""""""""""
""""""""""""""""""""""""" 

au TermOpen * setlocal nonumber norelativenumber
set number
set numberwidth=4
set relativenumber

set expandtab
set laststatus=2
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""" 
" [ HASN'T BEEN SORTED OUT YET ] "     # unsorted
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" 

filetype plugin on
let g:highlightedyank_highlight_duration=150
set hidden
set nocompatible
set omnifunc=syntaxcomplete#Complete
syntax on
