" Plugin manager is vim-plugged
call plug#begin('~/.local/share/nvim/plugged')

" Make default vim more usable
Plug 'tpope/vim-sensible'

" Gruvbox
Plug 'embark-theme/vim'

" Fancy statusline, most 'show metadata in the statusline' plugins look nicer now
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Use external fzf for file navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Mostly linting and language server support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use lf for more visual file navigation, also preview buffers
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

" Because I'm too lazy to type "_di(F(p
Plug 'vim-scripts/ReplaceWithRegister'

" taBs vS sPaCeS
Plug 'editorconfig/editorconfig-vim'

" CSS color previews
Plug 'norcalli/nvim-colorizer.lua'

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

" Handy indentation lines
Plug 'Yggdroot/indentLine'

" 99.999999% of the time my workflow involves Git
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'

" All syntax highlighting stuff
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'plasticboy/vim-markdown'
Plug 'hashivim/vim-terraform'

" Async linting engine
Plug 'w0rp/ale'

" Automatic tag generation
Plug 'ludovicchabant/vim-gutentags'

" Direnv
Plug 'direnv/direnv.vim'

call plug#end()

" Space is my leader key
let mapleader=" "
let maplocalleader="\\"

" :Cf to open this file, :Cfr to reload this config in current env
command! Cf edit $MYVIMRC " This used to be <leader>fed
command! Cfr source $MYVIMRC " This used to be <leader>qR

" If you open a directory you'll get lf and not netrw
let g:lf_replace_netrw=1

" Use tab to navigate through autocomplete susggestions
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" I'm not leet hacker enough so I still use the mouse
set mouse=a

" 'Go align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🔪'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Put linting information in the statusline
let g:airline#extensions#tabline#enabled=1

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

" Enable Gruvbox and use a non-eye gore color palette. The rest is just
" making everything look pretty
if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:embark_terminal_italics=1
colorscheme embark
let g:airline_theme='embark'
let g:airline_powerline_fonts=1
set laststatus=2 " Always render the status line

" Enable indent guides
let g:indentLine_enabled=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=4
let g:indent_guides_guide_size=1

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

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Enable jsdoc
let g:javascript_plugin_jsdoc=1

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
set path=**
set wildignore+=**/node_modules/**

" Inherit terminal background colors
hi Normal guibg=NONE ctermbg=NONE

set cmdheight=2

" Limelight + Goyo presentation settings
let g:goyo_linenr=1
let g:goyo_width=120

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Do not conceal markdown syntax
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0

command! Lim Limelight!!
nmap <Leader>ll <Plug>(Limelight)
xmap <Leader>ll <Plug>(Limelight)

lua require'colorizer'.setup()
set nofoldenable

