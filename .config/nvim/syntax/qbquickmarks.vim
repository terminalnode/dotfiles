" Vim syntax file
" Language: Qutebrowser Quickmarks File
" Maintainer: Alexander Rundberg
" Latest Revision: 2020-08-11

if exists("b:current_syntax")
  finish
endif

" Groups
" Note: Qutebrowser only recognises lines that START with # as comments.
syn match Comment '^#.*$'
syn match BadComment '\(^\)\@<!#.*$'
syn match Url '\(https\?\|ftp\)://\S\+\($\|\s\)' skipwhite
syn match Url '\(about\|file\|data\|javascript\):\S\+\($\|\s\)'
syn match Name '^[^#]\+ ' skipwhite nextgroup=Url


" Add highlights
"hi def link qmfComment      Comment
hi def link Url          Constant
hi def link Name         Label
hi def link BadComment   Error
