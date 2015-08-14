" Configuration

" Remap Command-Mode
inoremap jk <ESC>

" Remap Leader
let mapleader = "\<Space>"

" Enable FileType-specific Plugins and Indentation
filetype plugin indent on

" Syntax Highlighting
if filereadable( expand("$HOME/.vim/colors/ir_black.vim") )
    colo ir_black
else
    colo darkblue
endif
syntax on

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

" Enter Clears Current Search Highlighting
" @todo(Noah): Look into a different hotkey
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
