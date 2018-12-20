"""""""""""""""""""" """ Vundle setup """
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
Plugin  'toupeira/vim-desertink'

" Other stuff
Plugin	'valloric/youcompleteme'
Plugin	'godlygeek/tabular'
Plugin  'PotatoesMaster/i3-vim-syntax'
Plugin	'vim-python/python-syntax'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""
""" Regular config starts here """
""""""""""""""""""""""""""""""""""
""" LOOK
colorscheme desertink
" These autocmds override theme to turn off bg colour.
" Just the second is good for making non-text and
" text bgs the same (i.e. lines in and after document)
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None
set background=dark
let g:airline_theme='desertink'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1

" Enable vim-python/python-syntax
let g:python_highlight_all = 1

""" FEEL
syntax on						" enables syntax highlighning
set number relativenumber		" neat line numbering
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
set splitbelow splitright		" better splittingbetaviour
set clipboard=unnamedplus		" sync clipboard with ^C ^V

" TODO
" set ttimeout
" set ttimeoutlen=100
" set updatetime=500

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

""" OTHER
nnoremap Q <Nop>
