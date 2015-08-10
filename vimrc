" Configuration

" Remap Command-Mode
inoremap jk <ESC>

" Remap Leader
let mapleader = "\<Space>"

" Enable FileType-specific Plugins and Indentation
filetype plugin indent on

" Syntax Highlighting
syntax on

" Allow UTF-8
set encoding=utf-8

" Configure Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Search Highlighting
set hlsearch

" Enter Clears Current Search Highlighting
" @todo(Noah): Look into a different hotkey
nnoremap <CR> :nohlsearch<CR>
