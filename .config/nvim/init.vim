source ~/.config/nvim/plugin/vim-buffet.vim

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

" Mostly linting and language server support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use lf for more visual file navigation, also preview buffers
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'rbgrouleff/bclose.vim'

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

" General config
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/bindings.vim

" Plugin-specific config
source ~/.config/nvim/plugin/ale.vim
source ~/.config/nvim/plugin/coc.vim
source ~/.config/nvim/plugin/vim-rooter.vim
source ~/.config/nvim/plugin/lightline.vim
source ~/.config/nvim/plugin/fzf.vim
source ~/.config/nvim/plugin/floaterm.vim
