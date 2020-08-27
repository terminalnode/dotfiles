" Vim syntax file
" Language: Newsboat URLs file
" Maintainer: Alexander Rundberg
" Latest Revision: 2020-08-27

if exists("b:current_syntax")
  finish
endif

" Groups
syn match Url '^https\?://\S\+\($\|\s\)' nextgroup=FeedName
syn match FeedName '"\~.\+"$'
syn match Category "^--_\S\+_--$"


" Add highlights
hi def link Url          Constant
hi def link Category     Label
hi def link FeedName     String
