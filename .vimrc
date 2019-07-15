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
" Vim airline + themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

" Other stuff
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'          " Necessary for deoplete in vim
Plug 'roxma/vim-hug-neovim-rpc' " Necessary for deoplete in vim
Plug 'godlygeek/tabular'

" Syntax highlighting
Plug 'terminalnode/sway-vim-syntax'
Plug 'vim-python/python-syntax', { 'for': 'python', 'branch': 'develop' }
Plug 'rust-lang/rust.vim'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'

call plug#end()

" PLUGINS (configuration)
" Neomake
call neomake#configure#automake('nrwi', 500)
" Python
let g:python_highlight_all = 1
" Tagbar
nmap <F8> :TagbarToggle<CR>
" Rust
let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""
""" Regular config starts here """
""""""""""""""""""""""""""""""""""
""" LOOK
" These autocmds override theme to turn off bg colour.
" Just the second is good for making non-text and
" text bgs the same (i.e. lines in and after document)
let g:airline_powerline_fonts=1
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None

" Nord theme
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#tabline#enabled = 1

""" FEEL
set number relativenumber		" neat line numbering
set scrolloff=10				" number of lines to show after end of document
set sidescrolloff=3
set nowrap
set wildmode=list:longest,full
set confirm						" ask to save instead of failing cmd due to unsaved changes
set splitbelow splitright		" better splittingbetaviour
set clipboard=unnamedplus		" sync clipboard with ^C ^V

" These options are needed in vim but default in neovim.
" Listed separately for convenience when converting config
syntax on                       " Turn syntax highlighing on
filetype plugin indent on	    " will use scripts in indent folder
set backspace=indent,eol,start	" allow backspacing over the listed items
set laststatus=2				" always show status line
set showcmd						" show vim command in last line of screen
set wildmenu					" makes it easier to use :find in directories
set background=dark             " sets background to... dark I guess?
set ttyfast                     " makes vim smoother by assuming a fast tty connection
set encoding=utf-8				" sensible encoding
set ruler						" show line/column of current cursor pos
set visualbell					" turn off beeping bell
set t_vb=						" turn off visual bell
set autoindent				    " copy indentation of previous line on new line
set smarttab				    " tab to suitable level instead of one tab at a time
set incsearch				    " match while searching
set hlsearch				    " highlight search matches
set ttimeout
set ttimeoutlen=50

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
set expandtab				" Make the tabkey insert spaces instead of tabs

""" SEARCH
set ignorecase				" ignore case when searching
set smartcase				" unless there are upper case letters in searchstr

""" OTHER
" No more ex-mode
nnoremap Q <Nop>

" Mappings for switching between tabs.
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tablast<CR>
nnoremap <C-k> :tabfirst<CR>

" Mappings for moving tabs
nnoremap <C-A-h> :tabm -1<CR>
nnoremap <C-A-l> :tabm +1<CR>
nnoremap <C-A-j> :tabm $<CR>
nnoremap <C-A-k> :tabm 0<CR>

" Ctrl+Space will find next <++>, jump to it and delete it.
nnoremap <C-Space> /<++><Enter>"_c4l
inoremap <C-Space> <Esc>/<++><Enter>"_c4l

""" MACROS
let mapleader = "§"

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
