" PLUGINS
" Indentation is not strictly necessary, but makes it easier to read I think.
call plug#begin('~/.local/share/nvim/plugged')
    " Vim airline/themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Vim color schemes. They all suck, but some suck less.
    Plug 'arcticicestudio/nord-vim'         " Doesn't work well with haskell, unfortunately.
    Plug 'ayu-theme/ayu-vim'                " let ayucolor= one of dark, mirage or light
    Plug 'joshdick/onedark.vim'             " Background sucks, needs to be darker.
    Plug 'drewtempelmeyer/palenight.vim'    " Background is acceptable, but needs to be darker.

    " Code auto complete and related things
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Syntax highlighting
    Plug 'terminalnode/sway-vim-syntax'     " My own fork of i3-vim-syntax. It's incomplete, but better than nothing
    Plug 'rust-lang/rust.vim'               " Rust syntax highlighting
    Plug 'ElmCast/elm-vim'
    Plug 'udalov/kotlin-vim'

    "Haskell specific
    Plug 'neovimhaskell/haskell-vim'

call plug#end()

" PLUGIN CONFIGURATION
" call neomake#configure#automake('nrwi', 500) " Set neomake to check code on write
let g:deoplete#enable_at_startup = 1         " Activate deoplete on startup
let g:rustfmt_autosave = 1                   " Rust.vim run rustfmt automatically on save.

" haskell-vim features
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" default indentation levels
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
let g:haskell_indent_let = 2
let g:haskell_indent_where = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:haskell_indent_guard = 2

" LOOK
set termguicolors   " needed for 99% of themes to not look awful.
colorscheme palenight
set background=dark
let g:airline_powerline_fonts=1
let g:airline_theme="palenight"
" Override theme to turn off bg colour. (doesn't work with termguicolors)
" autocmd ColorScheme * highlight Normal ctermbg=None
" autocmd ColorScheme * highlight NonText ctermbg=None

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

" KEYBOARD MAPPINGS
" Unmap Q from ex-mode because ex-mode is a scourge.
nnoremap Q <Nop>

" Mappings for switching between tabs.
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tablast<CR>
nnoremap <C-k> :tabfirst<CR>
nnoremap <C-n> :tabnew<Space>

" Mappings for moving tabs
nnoremap <C-A-h> :tabm -1<CR>
nnoremap <C-A-l> :tabm +1<CR>
nnoremap <C-A-j> :tabm $<CR>
nnoremap <C-A-k> :tabm 0<CR>

" Ctrl+Space will find next <++>, jump to it and delete it.
" Very useful for macros
nnoremap <C-Space> /<++><Enter>"_c4l
inoremap <C-Space> <Esc>/<++><Enter>"_c4l

" :w!! will write to file using sudo
cmap w!! w !sudo tee > /dev/null %

" MACROS
" Not updated as they're currently not really in use.
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
