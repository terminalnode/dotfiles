""""""""""""""""""""
""" Vundle setup """
""""""""""""""""""""
" This part is required for vundle to work.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" See quick start help for more instructions
" on how to use vundle and add plugins
" https://github.com/VundleVim/Vundle.vim

" Vim airline + themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Other themes
Plugin 'ashfinal/vim-colors-violet'

" Code auto completion engine
Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""
""""""" Vundle config over """""""
""" Regular config starts here """
""""""""""""""""""""""""""""""""""

" Look
colorscheme violet
set background=dark
let g:airline_theme='violet'

" Feel
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
syntax on 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set ruler
set undolevels=1000

set backspace=indent,eol,start
