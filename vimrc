" Anthony Perkins
" https://git.acperkins.com/acp/vimfiles
"
" Distributed under the VIM license.  See ':help license' for a copy.
" Files under pack/ have their own licenses.
"
" Includes parts from Tim Pope's «sensible.vim»
" <https://github.com/tpope/vim-sensible>.

"=============================================================================
" Set this first to avoid overwriting later settings.
set nocompatible

"=============================================================================
" Load Pathogen if Vim does not support packages.
if !has("packages")
	runtime pack/acp/opt/vim-pathogen/autoload/pathogen.vim
	execute pathogen#infect('pack/acp/start/{}')
endif

"=============================================================================
" General settings for all builds.

nmap <space> <leader>

inoremap <left>  <nop>
inoremap <down>  <nop>
inoremap <up>    <nop>
inoremap <right> <nop>
nnoremap <left>  <nop>
nnoremap <down>  <nop>
nnoremap <up>    <nop>
nnoremap <right> <nop>

nnoremap <F7> :setlocal spell! spelllang=en_gb<CR>
nnoremap <F10> :put =strftime('%FT%T%z')<CR>
nnoremap <F11> :Goyo<bar>:Limelight!!<CR>
nnoremap gB :bprevious<CR>
nnoremap gb :bnext<CR>

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set colorcolumn=79
set directory=$TEMP//,/tmp//,.
set display+=lastline
set encoding=utf-8
set formatoptions-=t
set history=1000
set ignorecase
set incsearch
set joinspaces
set laststatus=2
set linebreak
set list
set listchars=tab:→·,trail:~,extends:>,precedes:<
set modelines=0
set noexpandtab
set nomodeline
set nrformats-=octal
set numberwidth=8
set relativenumber
set ruler
set sessionoptions-=options
set smartcase
set smarttab
set spl=en_gb nospell
set tabstop=8
set textwidth=78
set ttimeout
set ttimeoutlen=100
set ttyfast
set wrap

"=============================================================================
" General settings for non-minimal Vim builds.

if has("eval")
	" Protect commands that are only available when +eval is enabled.
	" Technically only "if 1" would be required, as "has()" is provided
	" by +eval, but this is clearer.
	command Q q
	command W w
	command WQ wq
	filetype plugin indent on
	let g:ale_completion_enabled=1
	let g:ale_sign_column_always=1
	let g:go_version_warning=0
	let g:netrw_altv=1
	let g:netrw_banner=0
	let g:netrw_browse_split=4
	let g:netrw_liststyle=3
	let g:netrw_sort_sequence='[\/]$,*'
	let g:netrw_winsize=-28
	let g:org_indent=0
	let g:org_tag_column=78
	" Set colour levels for different terminals.
	if &term == "xterm-256color"
		set t_Co=256
	elseif &term == "xterm"
		set t_Co=256
	elseif &term == "rxvt-unicode"
		set t_Co=256
	else
		set t_Co=16
	endif
	colorscheme PaperColor
endif

"=============================================================================
" Settings based on feature detection.

if has("autocmd")
	autocmd BufRead,BufNewFile *.go set noet sw=8 ts=8
	autocmd BufRead,BufNewFile *.html set et sw=2
	autocmd BufRead,BufNewFile *.md set ft=markdown sw=4
	autocmd BufRead,BufNewFile *.opml set et sw=2
	autocmd BufRead,BufNewFile *.xml set et sw=2
	autocmd BufRead,BufNewFile *.yml set et sw=2
endif

if has("folding")
	set nofoldenable
endif

if has("gui_running")
	if has("gui_gtk")
		set clipboard=unnamedplus
		set guifont=Monospace\ 11
	elseif has("gui_win32")
		set clipboard=unnamed
		set guifont=Consolas:h10:cANSI
	endif
	set background=light
	set columns=90
	set guioptions+=cm
	set guioptions-=T
	set lines=30
endif

if has("patch-7.3.541")
	set formatoptions+=j
endif

if has("printer")
	set printheader=%t%h%m%=Page\ %N
	set printoptions=paper:A4,number:y,syntax:n
endif

if has("smartindent")
	set smartindent
endif

if has("syntax")
	syntax on
endif

if has("viminfo")
	set viminfo="NONE"
endif

if has("wildmenu")
	set wildmenu
endif

"=============================================================================
" End of config file.
" vim:set ft=vim:
