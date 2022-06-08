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
syntax region prUrl start="<.*:\/\/" end=">"

" ISO date.
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}\>/

" ISO time.
syntax match prDate /\<T\d\{2}:\d\{2}\>/
syntax match prDate /\<T\d\{2}:\d\{2}Z\>/

" ISO date and time.
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}\>/
syntax match prDate /\<\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}Z\>/

highlight link prName Title
highlight link prTodo Exception
highlight link prWork Conditional
highlight link prDone Comment
highlight link prDate Number
highlight link prUrl String

let b:current_syntax = 'actodo'
