" Project syntax file.
" Anthony Perkins

if exists("b:current_syntax")
	finish
endif

syntax region prName start="^\s*#" end="$"
syntax match prName /^.\+\n=\+$/
syntax match prName /^.\+\n-\+$/
syntax match prTodo /^\s*TODO:/
syntax match prWork /^\s*WORK:/
syntax match prDone /^\s*DONE:/

" ISO date.
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}\>/

" ISO time.
syntax match prDate /\<T\d\{2}:\d\{2}\>/
syntax match prDate /\<T\d\{2}:\d\{2}[+-]\d\{2}:\d\{2}\>/
syntax match prDate /\<T\d\{2}:\d\{2}Z\>/

" ISO date and time.
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}\>/
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}[+-]\d\{2}:\d\{2}\>/
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}Z\>/

hi prName term=bold cterm=bold gui=bold
hi prTodo term=bold,underline cterm=bold,underline gui=bold,underline ctermfg=1 guifg=#ff0000
hi prWork term=bold,underline cterm=bold,underline gui=bold,underline ctermfg=2 guifg=#00ff00
hi prDone term=bold,underline cterm=bold,underline gui=bold,underline ctermfg=7 guifg=#808080
hi prDate term=bold cterm=bold gui=bold ctermfg=4 guifg=#0000ff

let b:current_syntax = 'pr'
