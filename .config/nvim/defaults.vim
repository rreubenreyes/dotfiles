set nocompatible
syntax on

" Configuration preferences
filetype plugin on

" Editing preferences
set clipboard=unnamed                " System clipboard
set cmdheight=2
set cursorline
set expandtab                        " Use spaces
set hidden                           " No orphaned buffers
set laststatus=2                     " Always render the status line
set mouse=a
set nofoldenable                     " No auto-folding
set noswapfile
set number
set numberwidth=4
set omnifunc=syntaxcomplete#Complete
set relativenumber
set shiftwidth=2
set shortmess+=c                     " Don't give |ins-completion-menu| messages.
set signcolumn=yes                   " Gutter
set splitbelow
set splitright
set t_ut=                            " Don't break colors when using vim in tmux
set tabstop=2
set wildignore+=**/node_modules/**
au TermOpen * setlocal nonumber norelativenumber " Do not use line numbers in terminal mode

" Appearance
if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:embark_terminal_italics=1
colorscheme embark

" Inherit terminal background colors
hi Normal guibg=NONE ctermbg=NONE
