" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

" Vim airline/themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

" Code auto complete thing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax highlighting
Plug 'terminalnode/sway-vim-syntax'
Plug 'rust-lang/rust.vim'

" Linter (async alternative for syntastic)
Plug 'neomake/neomake'

" Haskell
" Code completion
" Requires: deoplete.nvim and stack install ghc-mod
" Plug 'eagletmt/neco-ghc' " stack install ghc-mod for this to work
" Syntax highlighting and stuff
" Plug 'neovimhaskell/haskell-vim'

" Copied from .vimrc, but not yet tested.
" Plug 'godlygeek/tabular'
" Syntax highlighting
" Plug 'vim-python/python-syntax', { 'for': 'python', 'branch': 'develop' }
" Plug 'majutsushi/tagbar'

call plug#end()

" PLUGINS (configuration)
" Set neomake to check code on write
call neomake#configure#automake('nrwi', 500)

" Activate deoplete on startup
let g:deoplete#enable_at_startup = 1

" Rust.vim run rustfmt automatically on save.
let g:rustfmt_autosave = 1

" Nord theme
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

" LOOK
" Override theme to turn off bg colour.
" Just the second is good for making non-text and
" text bgs the same (i.e. lines in and after document)
let g:airline_powerline_fonts=1
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None
set background=dark
colorscheme nord

" FEEL
set guicursor=              " disable neovim setting cursor
set number relativenumber	" neat line numbering
set scrolloff=10            " number of lines to show after end of document
set sidescrolloff=3
set nowrap
set wildmode=list:longest,full
set confirm			        " ask to save instead of failing cmd due to unsaved changes
set splitbelow splitright	" better splitting behaviour
set clipboard=unnamedplus	" sync clipboard with ^c and ^v
set ignorecase			    " ignore case when searching...
set smartcase			    " ...unless there are upper case letters in searchstr

" TABS & SEARCH
set shiftwidth=4		    " size of an indentation 
set tabstop=4			    " length of a tab character in spaces
set softtabstop=0		    " idk felt cute might delete later
set expandtab			    " Make the tabkey insert spaces instead of tabs

" FORMAT OPTIONS
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

" OTHER
" Unmap Q from ex-mode
nnoremap Q <Nop>

" Ctrl+Space will find next <++>, jump to it and delete it.
nnoremap <C-Space> /<++><Enter>"_c4l
inoremap <C-Space> <Esc>/<++><Enter>"_c4l

" :w!! will write to file using sudo
cmap w!! w !sudo tee > /dev/null %

" MACROS
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
