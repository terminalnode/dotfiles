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
Plugin 'ashfinal/vim-colors-violet'

" Other stuff
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-sensible'

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
runtime! plugin/sensible.vim
