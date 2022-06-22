" actodo syntax file.
" Anthony Perkins

if exists("b:current_syntax")
	finish
endif

syntax match actodoName /#\+\s\+.\+/
syntax match actodoTodo /^\s*TODO:/
syntax match actodoWork /^\s*WORK:/
syntax match actodoDone /^\s*DONE:/
syntax match actodoUrl /<.*:\/\/.\+>/
syntax match actodoTicket /##\d\+##/
syntax match actodoTicket /##\d\+##/
syntax match actodoDone /##\d\+:Closed##/

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
highlight actodoTodo term=bold cterm=bold gui=bold ctermfg=red guifg=red
highlight actodoWork term=bold cterm=bold gui=bold ctermfg=green guifg=green
highlight actodoDate term=bold cterm=bold gui=bold ctermfg=blue guifg=blue
highlight actodoUrl ctermfg=blue guifg=blue
highlight actodoTicket term=bold cterm=bold gui=bold ctermfg=DarkCyan guifg=DarkCyan
if &background ==# 'light'
	highlight actodoDone term=bold cterm=bold gui=bold ctermfg=LightGray guifg=LightGray
else
	highlight actodoDone term=bold cterm=bold gui=bold ctermfg=DarkGray guifg=LightGray
endif

let b:current_syntax = 'actodo'
