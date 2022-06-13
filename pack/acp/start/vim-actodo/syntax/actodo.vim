" actodo syntax file.
" Anthony Perkins

if exists("b:current_syntax")
	finish
endif

syntax region actodoName start="^\s*#" end="$"
syntax match actodoTodo /^\s*TODO:/
syntax match actodoWork /^\s*WORK:/
syntax match actodoDone /^\s*DONE:/
syntax region actodoUrl start="<.*:\/\/" end=">"
syntax match actodoTicket /##\d\+##/
syntax match actodoTicket /##\d\+## (open)/
syntax match actodoTicket /##\d\+## (closed)/

" ISO date.
syntax match actodoDate /\<\d\{4}-\d\{2}-\d\{2}\>/

" ISO time.
syntax match actodoDate /\<T\d\{2}:\d\{2}\>/
syntax match actodoDate /\<T\d\{2}:\d\{2}Z\>/

" ISO date and time.
syntax match actodoDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}\>/
syntax match actodoDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}Z\>/

" Days of the week.
syntax match actodoDate /\<Monday\>/
syntax match actodoDate /\<Tuesday\>/
syntax match actodoDate /\<Wednesday\>/
syntax match actodoDate /\<Thursday\>/
syntax match actodoDate /\<Friday\>/
syntax match actodoDate /\<Saturday\>/
syntax match actodoDate /\<Sunday\>/
syntax match actodoDate /\<Mon\>/
syntax match actodoDate /\<Tue\>/
syntax match actodoDate /\<Wed\>/
syntax match actodoDate /\<Thu\>/
syntax match actodoDate /\<Fri\>/
syntax match actodoDate /\<Sat\>/
syntax match actodoDate /\<Sun\>/

highlight actodoName term=bold,underline cterm=bold,underline gui=bold,underline
highlight actodoTodo term=bold cterm=bold gui=bold ctermfg=1 guifg=#ff0000
highlight actodoWork term=bold cterm=bold gui=bold ctermfg=2 guifg=#00ff00
highlight actodoDone term=bold cterm=bold gui=bold ctermfg=7 guifg=#808080
highlight actodoDate term=bold cterm=bold gui=bold ctermfg=4 guifg=#0000ff
highlight actodoUrl ctermfg=4 guifg=#0000ff
highlight actodoTicket term=bold cterm=bold gui=bold ctermfg=6 guifg=#008080

let b:current_syntax = 'actodo'
