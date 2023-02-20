source ~/.config/nvim/plugin/vim-buffet.vim

" Plugin manager is vim-plugged
call plug#begin('~/.local/share/nvim/plugged')

" Make default vim more usable
Plug 'tpope/vim-sensible'

" Copilot
Plug 'github/copilot.vim'

" Pretty things
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'lukas-reineke/indent-blankline.nvim'

" Fancy statusline, most 'show metadata in the statusline' plugins look nicer now
Plug 'bagrat/vim-buffet'
Plug 'hoob3rt/lualine.nvim'

" Use external fzf for file navigation
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Mostly linting and language server support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" JavaScript/TypeScript
Plug 'jose-elias-alvarez/typescript.nvim'

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

" vim sessions
Plug 'tpope/vim-obsession'

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
" Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'

" All syntax highlighting stuff
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'hashivim/vim-terraform', { 'for': ['terraform'] }
Plug 'google/vim-jsonnet'
Plug 'chrisbra/csv.vim', { 'for': ['csv'] }

" Automatic tag generation
" Plug 'ludovicchabant/vim-gutentags'

" Direnv
" Plug 'direnv/direnv.vim'
" Plug 'moll/vim-bbye'

call plug#end()

" General config
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/bindings.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/treesitter.vim

" Plugin-specific config
source ~/.config/nvim/plugin/vim-rooter.vim
source ~/.config/nvim/plugin/vim-gitgutter.vim
source ~/.config/nvim/plugin/nvim-cmp.vim
source ~/.config/nvim/plugin/lualine.vim
source ~/.config/nvim/plugin/vim-tabular.vim
source ~/.config/nvim/plugin/fzf.vim
source ~/.config/nvim/plugin/floaterm.vim
source ~/.config/nvim/plugin/indent-blankline.vim
