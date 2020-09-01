" Configuration


" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-unimpaired'

Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
"Plugin 'gilligan/vim-lldb'

" Plugin 'gregsexton/MatchTag'

Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/twilight'

Plugin 'jansedivy/jai.vim'
Plugin 'strogonoff/vim-coffee-script'

if v:version >=704
    " @TODO(Noah): Changes to python install break this setup
    "let $PATH = '/usr/local/bin:'.$PATH
    "Plugin 'Valloric/YouCompleteMe'
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

let NERDSpaceDelims=1

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

" Use hybrid line numebrs
set relativenumber
set number

set ruler

" Incremental Search
set incsearch

" Search Highlighting
set hlsearch

" Scrolloff
set scrolloff=3

" Enter: Toggles Current Search Highlighting
" Also highlights word under cursor if nothing is highlighted
nnoremap <CR> :set hlsearch!<CR>mh*`h

" Highligh the word under the cursor
augroup highlight_word_on_idle
    autocmd!
"   autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    autocmd CursorHold  * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', '')
augroup END

" Highlight lines longer than 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Copy selection to search register
vnoremap // y/<C-R>"<CR>

" Vsplit to the right
set splitright

" Auto-complete/Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

" Custom Command Mapping conventions
" <leader><leader>[...]   Commands used once per session
" <leader>[...]           Commands 'frequently', around once per file

" Change working directory
nnoremap <leader><leader>cd<space>  :cd 
nnoremap <leader><leader>cdbbx :cd ~/git/backbook/exchange:E
nnoremap <leader><leader>cdbbw :cd ~/git/backbook/exchange-web:E
nnoremap <leader><leader>cdbbp :cd ~/git/backbook/platform-admin-web:E
nnoremap <leader><leader>cdbbf :cd ~/git/backbook/fileservices:E
nnoremap <leader><leader>cdbbc :cd ~/git/backbook/bb-cloud-functions:E
nnoremap <leader><leader>cdlpa :cd ~/git/lpdb/lpdb-api:E
nnoremap <leader><leader>cdlpv :cd ~/git/lpdb/lpdb-vue:E
nnoremap <leader><leader>cdla  :cd ~/git/lapel:E
nnoremap <leader><leader>cdci  :cd ~/git/civil-ev:E

" Shorthand for opening file
noremap  <leader>te :tabedit<space>
nnoremap <leader>vs :vsplit<space>
nnoremap <leader>te<space> :tabedit<space>
nnoremap <leader>vs<space> :vsplit<space>
nnoremap <leader>tee :vsplitT
nnoremap <leader>vss :vsplit
nnoremap <leader>teE :vsplitT:vsplit:E
nnoremap <leader>vsE :vsplit:E

"" Edit the vimrc file
nnoremap <silent> <leader>evr :tabedit $MYVIMRC<CR>

"" Edit standard project files
"   ee - edit local (to project)
"   eg - edit global

nnoremap <silent> <leader>eet  :tabedit ./todo.txt<CR>
nnoremap <silent> <leader>eei  :tabedit ./.gitignore<CR>
nnoremap <silent> <leader>egi  :tabedit ~/.gitignore_global<CR>
nnoremap <silent> <leader>egt  :tabedit ~/Desktop/ideas.txt<CR>
nnoremap <silent> <leader>egl  :tabedit ~/Desktop/learned.txt<CR>


" Auto-Reload .vimrc on :w
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


"" Probably Actual (Non-Experimental) Mappings

" Clear current line and remain in normal mode.
nnoremap <leader>D cc

" Tab Swapping
nnoremap <C-S-Left> :tabprevious
nnoremap <C-S-Right> :tabnext



"" Experimental Mappings

" "" Code-Blocks: Rspec
" noremap <leader>de odescribe '' doendkf'a
" noremap <leader>De Odescribe '' doendkf'a
" noremap <leader>cx ocontext '' doendkf'a
" noremap <leader>Cx Ocontext '' doendkf'a
" noremap <leader>be obefore :each doendO
" noremap <leader>Be Obefore :each doendO
" noremap <leader>it oit '' doendkf'a
" noremap <leader>It Oit '' doendkf'a
" noremap <leader>le olet(:) {}F:a
" noremap <leader>Le Olet(:) {}F:a

"" Add new @TODO Note
nmap <leader>nn O@(Noah):  cc==f@a
nmap <leader>nt O@(Noah):  cc==f@aTODOf:la


" [ ]-style checkbox lists
noremap <leader>Xi o[ ]<space>
noremap <leader>Xo o[ ]<space>
noremap <leader>XO O[ ]<space>
nnoremap <leader>XX mmI[ ] `m
nnoremap <leader>XU mm:s/\[.\] //`m
nnoremap <leader>xx mm:s/\[.\]/[X]/`m
nnoremap <leader>x/ mm:s/\[.\]/[\/]/`m
nnoremap <leader>x. mm:s/\[.\]/[.]/`m
nnoremap <leader>xu mm:s/\[.\]/[ ]/`m

" Unimpared-style character swapping
" @todo(Noah) Add vim-repeat support
"   - silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
nnoremap [c xhP
nnoremap ]c xp

vnoremap [c dhP`<hm<`>hm>gv
vnoremap ]c dp`<lm<`>lm>gv

" Snake-case word breaks
nnoremap  _   f_l
nnoremap c_  ct_
nnoremap d_  dt_
nnoremap ca_ cf_
nnoremap da_ df_


" Switch to 2-space tabs for Ruby, etc.
command! SetTabCondensed execute "set tabstop=2 | set shiftwidth=2 | set expandtab"
" Switch to 4-space tabs for everything else
command! SetTabNormal execute "set tabstop=4 | set shiftwidth=4 | set expandtab"

" Switch to 2-space tabs for .coffee files automatically.
autocmd BufNewFile,BufReadPost *.coffee setl tabstop=2 shiftwidth=2 expandtab

" Switch to 4-space tabs for .coffee files automatically.
autocmd BufNewFile,BufReadPost *.rb setl tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufReadPost *.rabl setl tabstop=4 shiftwidth=4 expandtab

"" File Clean Macros
" Current File Version
"let @C='mh:retab:%s/\s\+$//ge`h'
nnoremap <leader><leader>cl mh:retab:%s/\s\+$//ge`h
" Multi-file Version
"let @C=':retab:%s/\s\+$//ge:wn'


" Git Conflict Resolution Helpers
" Select Top Option
nnoremap <leader><leader>st />>>>>>>V?=======d?<<<<<<<dd
" Select Bottom Option
nnoremap <leader><leader>sb /<<<<<<<V/=======d/>>>>>>>dd


" See: https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" filename / dirname of the current file {{{
    " copy result to the system clipboard and echo the result
    " the cb> prompt means the clipboard
    " *f*ile *n*ame, ex. init.vim
    map <Leader>fn :let @+ = expand("%:t") \| echo 'cb> ' . @+<CR>
    " *f*ile *p*ath, ex. /home/user/nvim/init.vim
    map <Leader>fp :let @+ = expand("%:p") \| echo 'cb> ' . @+<CR>
    " *d*irectory *p*ath, ex. /home/user/nvim
    map <Leader>dp :let @+ = expand("%:p:h") \| echo 'cb> ' . @+<CR>
    " *d*irectory *n*ame, ex. nvim
    map <Leader>dn :let @+ = expand("%:p:h:t") \| echo 'cb> ' . @+<CR>
" }}}


" In Development
" 'Related File' Mappings
" Open spec file from implementation file
" command! OpenSpecForImplementation execute ":vsplit expand(':~:.:s?app/?spec?:')"
