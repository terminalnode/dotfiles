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
Plugin	'vim-airline/vim-airline'
Plugin	'vim-airline/vim-airline-themes'
Plugin	'ashfinal/vim-colors-violet'
Plugin	'chriskempson/base16-vim'

" Other stuff
Plugin	'valloric/youcompleteme'
Plugin	'godlygeek/tabular'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""
""" Regular config starts here """
""""""""""""""""""""""""""""""""""
""" LOOK
colorscheme violet
set background=dark
let g:airline_theme='violet'

""" FEEL
syntax on						" enables syntax highlighning
set relativenumber				" numbering lines relative to current pos
set number						" also show current line number
set encoding=utf-8				" sensible encoding
set scrolloff=10				" number of lines to show after end of document
set sidescrolloff=3
set showmatch					" when a bracket is inserted, jump to show matching one
set nowrap
set wildmenu					" makes it easier to use :find in directories
set wildmode=list:longest,full
set showcmd						" show vim command in last line of screen
set ruler						" show line/column of current cursor pos
set ttyfast
set backspace=indent,eol,start	" allow backspacing over the listed items
set laststatus=2				" always show status line
set confirm						" ask to save instead of failing cmd due to unsaved changes
set visualbell					" turn off beeping bell
set t_vb=						" turn off visual bell

" :w!! will write to file using sudo
cmap w!! w !sudo tee > /dev/null %

""" FORMAT OPTIONS
" defaults = tcq
" t		auto-wrap using textwidth
" c		auto-wrap comments using textwidth
" q		allow formating of comments with 'gq'
" r		automatically insert current comment leader after <enter> in insert mode
" n		recognise numbered lists
" 1		break line before one letter word if possible, not after
" M		when joining line, no space before/after multibyte chars
" j		when sense it does make, comment leader go away, in joining of lines
set formatoptions=rqn1Mj

""" TABS
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4			" defaults to tabstop
filetype plugin indent on	" will use scripts in indent folder

""" SEARCH
set ignorecase				" ignore case when searching
set smartcase				" unless there are upper case letters in searchstr
set incsearch				" match while searching
set hlsearch				" highlight search matches