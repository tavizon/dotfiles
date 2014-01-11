"
" JesseTavizon - ~/.vimrc 
"
set number
syntax on
set t_Co=256
set ruler
"
" setting tab name to include current file edited by vim
"
set t_ts=]1;
set t_fs=
set title
let &titleold=getcwd()
"
" tab and indent settings
"
set tabstop=3
set shiftwidth=3
set expandtab
set autoindent
filetype indent on
filetype plugin on
"
" enabling trackpad and mouse scrolling - option key enables text selection
"
set mouse=nicr
