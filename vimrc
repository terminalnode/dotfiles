"""""""""""""""""""""""""""""""""""
""" Pull vim plug automatically """
"""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""
""" vim plug setup """
""""""""""""""""""""""
" This part is required for vundle to work.
" Unclear if necessary for vim plug
set nocompatible

call plug#begin('~/.vim/plugged')
" Vim plug itself
Plug 'junegunn/vim-plug'

" Vim airline + themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

" Other stuff
Plug 'valloric/youcompleteme'
Plug 'godlygeek/tabular'

" Syntax highlighting
Plug 'terminalnode/sway-vim-syntax'
Plug 'vim-python/python-syntax'
Plug 'neovimhaskell/haskell-vim'

call plug#end()

""""""""""""""""""""""""""""""""""
""" Regular config starts here """
""""""""""""""""""""""""""""""""""
""" LOOK
" These autocmds override theme to turn off bg colour.
" Just the second is good for making non-text and
" text bgs the same (i.e. lines in and after document)
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None

set background=dark
" colorscheme nord " nord colorscheme can't do haskell so fuck it
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_cursor_line_number_background = 1
let g:airline_powerline_fonts=1
" Enable vim-python/python-syntax
let g:python_highlight_all = 1

"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#tabline#enabled = 1
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keyword

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

""" TAB SETTINGS
set shiftwidth=4			" size of an indentation 
set tabstop=4				" length of a tab character in spaces
set softtabstop=0			" idk felt cute might delete later
set autoindent				" copy indentation of previous line on new line
set expandtab				" Make the tabkey insert spaces instead of tabs
set smarttab				" tab to suitable level instead of one tab at a time
filetype plugin indent on	" will use scripts in indent folder

""" SEARCH
set ignorecase				" ignore case when searching
set smartcase				" unless there are upper case letters in searchstr
set incsearch				" match while searching
set hlsearch				" highlight search matches

""" OTHER
" No more ex-mode
nnoremap Q <Nop>
" Double space in insert mode will find next <++>, jump to it and delete it.
inoremap <C-Space> <Esc>/<++><Enter>"_c4l

""" MACROS
" TODO	These mappings are kinda shitty, specifically the
"		leader key being ; and used in insert mode.
"		Needs to be remapped to something non-ridiculous.
let mapleader = ";"
" [;p] print
" (python, rust)
autocmd FileType python inoremap <Leader>p print(<++>)<Esc>0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>p println!("<++>"<++>);<Esc>0/<++><Enter>"_c4l
" [;a] array/list
" (python, rust)
" Python version is kinda iffy, but also only included for completeness.
autocmd FileType python inoremap <Leader>a <++> = [<++>]<++><Esc>k$/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>a let <++>: [<++>; <++>] = [<++>];<++><Esc>0/<++><Enter>"_c4l
" [;f] create function
" (python, rust)
autocmd FileType python inoremap <Leader>f def <++>(<++>):<Enter><++><Esc>k0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>f fn <++>() {<Enter><++><Enter>}<Esc>kk0/<++><Enter>"_c4l
" [;c] create class 
" (python, rust TBA)
autocmd FileType python inoremap <Leader>c class <++>():<Enter>def __init__(self<++>):<Enter><++><Esc>kk0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>c <Nop>
" [<L>-tf] try-finally
" (python, rust TBA)
autocmd FileType python inoremap <Leader>tf	try:<Enter><++><Enter><Enter>except Exception as e:<Enter><++><Enter><Enter>finally:<Enter><++><Esc>6k0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>tf <Nop>
