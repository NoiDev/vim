" Configuration

" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdcommenter'

Plugin 'altercation/vim-colors-solarized' 

Plugin 'gregsexton/MatchTag'

Plugin 'tpope/vim-repeat.git'

Plugin 'tpope/vim-unimpaired'

if v:version >= 704
    Plugin 'Valloric/YouCompleteMe'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Remap Leader
let mapleader = "\<Space>"

" Enable FileType-specific Plugins and Indentation
filetype plugin indent on

" Syntax Highlighting
syntax enable
set background=dark

"if has("gui_running") && filereadable( expand('$HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim') )
if filereadable( expand('$HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim') )
    set background=dark 
    colo solarized
elseif filereadable( expand('$HOME/.vim/colors/ir_black.vim') )
    colo ir_black
else
    colo darkblue
endif


" @todo(Noah): Fonts
" Consolas Regular
" Liberation Mono
" Menlo (modifier?)

" Allow UTF-8
set encoding=utf-8

" Configure Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Incremental Search
set incsearch

" Search Highlighting
set hlsearch

" Scrolloff
set scrolloff=3

" Enter Clears Current Search Highlighting
" @todo(Noah): Look into a different hotkey
" @todo(Noah): Silence message if no search.
nnoremap <CR> :nohlsearch<CR>

" Auto-complete/Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

