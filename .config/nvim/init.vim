"""""""""""
""" PLUGINS
"""""""""""
" Indentation is not strictly necessary, but makes it easier to read I think.
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'qpkorr/vim-bufkill'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-rooter'

    " Textobjects
    Plug 'kana/vim-textobj-user'
    Plug 'beloglazov/vim-textobj-quotes'
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'tek/vim-textobj-ruby'

    " Aesthetics (except color schemes)
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'drewtempelmeyer/palenight.vim'

    " Syntax highlighting / IDE features
    Plug 'terminalnode/sway-vim-syntax'
    Plug 'rust-lang/rust.vim'
    Plug 'ElmCast/elm-vim'
    Plug 'udalov/kotlin-vim'
    Plug 'yuezk/vim-js'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'cespare/vim-toml'
call plug#end()


""""""""""""""""""""""""""
""" PLUGIN FEATURE TOGGLES
""""""""""""""""""""""""""
let g:rustfmt_autosave = 1                  " run rustfmt automatically on rust filetype save
let g:haskell_enable_quantification = 1     " to enable highlighting of haskell `forall`
let g:haskell_enable_recursivedo = 1        " to enable highlighting of haskell `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1        " to enable highlighting of haskell `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of haskell `pattern`
let g:haskell_enable_typeroles = 1          " to enable highlighting of haskell type roles
let g:haskell_enable_static_pointers = 1    " to enable highlighting of haskell `static`
let g:haskell_backpack = 1                  " to enable highlighting of haskell backpack keywords
let g:haskell_indent_if = 2                 " use two space indentation for haskell if
let g:haskell_indent_case = 2               " use two space indentation for haskell case
let g:haskell_indent_let = 2                " use two space indentation for haskell let
let g:haskell_indent_where = 2              " use two space indentation for haskell where
let g:haskell_indent_before_where = 2       " use two space indentation before haskell where
let g:haskell_indent_after_bare_where = 2   " use two space indentation after haskell where
let g:haskell_indent_do = 2                 " use two space indentation for haskell do
let g:haskell_indent_in = 2                 " use two space indentation for haskell in
let g:haskell_indent_guard = 2              " use two space indentation for haskell guard rails
let g:javascript_plugin_flow = 1            " enable syntax highlighting for javascript flow
let g:javascript_plugin_jsdoc = 1           " enable syntax highlighting for jsdocs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" vim-rooter configuration
" Changes active directory to closest dir with a git-file.
" If none is found, change to directory of current file.
let g:rooter_patterns = ['.root-marker', 'package.json', 'Rakefile', 'Pipfile', '.git', '.git/']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:ctrlp_working_path_mode = 'a'

"""""""""""""""""""""
""" COC CONFIGURATION
"""""""""""""""""""""
" Show documentation in preview window
function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
nmap <a-cr> :<C-u>CocFix<cr>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>


"""""""""""""""""""""""
""" LOOKS CONFIGURATION
"""""""""""""""""""""""
" needed for 99% of themes to not look awful.
set termguicolors

" Highlight any extra whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=darkred
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=darkred

colorscheme palenight
set background=dark
let g:airline_powerline_fonts=1
let g:airline_theme="palenight"


""""""""""""""""""""""""""""""""""
""" GENERIC SETTINGS CONFIGURATION
""""""""""""""""""""""""""""""""""
set hidden                  " buffers
set number relativenumber   " neat line numbering
set scrolloff=10            " number of lines to show after end of document
set confirm                 " ask to save instead of failing cmd due to unsaved changes
set splitbelow splitright	  " better splitting behaviour
set clipboard=unnamedplus	  " sync clipboard with ^c and ^v
set ignorecase              " ignore case when searching...
set smartcase               " ...unless there are upper case letters in searchstr
set signcolumn=yes          " always show signcolumns
set updatetime=300          " how many ms nvim should wait after you stop typing to trigger plugins
set sidescrolloff=3
set nowrap
set wildmode=list:longest,full
set guicursor=
" Tabs and search stuff
set shiftwidth=2            " size of an indentation
set tabstop=2               " number of spaces a tab-character will be displayed as
set softtabstop=2           " number of spaces a tab will be when editing/inserting
set expandtab               " make the tabkey insert spaces instead of tabs
set listchars=tab:<->       " use `:set list` to view tabs as '<->' (will only be <> with two space tabs)
set wildignore+=*/tmp/*,*/node_modules/*,*/__pycache__/,*/htmlcov/*,*/coverage/*,*.db


"""""""""""""""""""""""""""""""
""" FORMAT OPTION CONFIGURATION
"""""""""""""""""""""""""""""""
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


"""""""""""""""""""""
""" KEYBOARD MAPPINGS
"""""""""""""""""""""
" Unmap Q from ex-mode because ex-mode is a scourge.
nnoremap Q <Nop>
" Mappings for switching between buffers etc
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-n> :Ex<CR>
" This is disabled because it interfers with split window mode.
" Might remap it to something else at some point.
" map <C-w> :bw<CR>

" :w!! will write to file using sudo
cmap w!! w !sudo tee > /dev/null %


""""""""""""""""""""""""
""" MACROS CONFIGURATION
""""""""""""""""""""""""
" Not updated as they're currently not really in use.
let mapleader = "§"
" Ctrl+Space will find next <++>, jump to it and delete it.
nnoremap <C-Space> /<++><Enter>"_c4l
inoremap <C-Space> <Esc>/<++><Enter>"_c4l

" [§p] print
" (python, rust)
autocmd FileType python inoremap <Leader>p print(<++>)<Esc>0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>p println!("<++>"<++>);<Esc>0/<++><Enter>"_c4l
autocmd FileTYpe ruby   inoremap <Leader>p puts <++><Esc>0/<++><Enter>"_c4l

" [§f] create function
" (python, rust)
autocmd FileType python inoremap <Leader>f def <++>(<++>):<Enter><++><Esc>k0/<++><Enter>"_c4l
autocmd FileType rust	inoremap <Leader>f fn <++>() {<Enter><++><Enter>}<Esc>kk0/<++><Enter>"_c4l
autocmd FileType ruby   inoremap <Leader>f def <++><Enter>end<Esc>k0/<++><Enter>"_c4l
