" Anthony Perkins
" https://git.acperkins.com/acp/vimfiles
"
" Distributed under the VIM license.  See ':help license' for a copy.
" Files under pack/ and coc/extensions/node_modules/ have their own licenses.
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

inoremap <C-BS> <C-W>
inoremap <C-a> <C-O>^
inoremap <C-e> <C-O>$
inoremap <F12> <C-\><C-O>:w<CR>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

nnoremap <F10> :put =strftime('%FT%T%z')<CR>
nnoremap <F11> :Goyo<bar>:Limelight!!<CR>
nnoremap <F12> :w<CR>
nnoremap <F7> :setlocal spell! spelllang=en_gb<CR>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap gB :bprevious<CR>
nnoremap gb :bnext<CR>

" Text wrapping and margin settings. Setting tw=72 is ideal for emails or
" anything that will be read in a Terminal, while tw=100 is better for code or
" for general text that will be viewed in a GUI. If printing, an A4-sized
" page should fit 100 columns at 8pt or 80 columns at 10pt, in Courier or
" Liberation Mono fonts.
set colorcolumn=101  " Suggestions: 73, 81, 101
set textwidth=100  " Suggestions: 72, 80, 100

" All other settings.
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=1
set directory=$TEMP//,/tmp//,.
set display+=lastline
set encoding=utf-8
set formatoptions+=t
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:→·,trail:~,extends:>,precedes:<
set modelines=0
set nobackup
set noexpandtab
set nojoinspaces
set nomodeline
set nowritebackup
set nrformats-=octal
set numberwidth=8
set relativenumber
set ruler
set scrolloff=2
set sessionoptions-=options
set shortmess+=c
set smartcase
set smarttab
set spl=en_gb nospell
set tabstop=8
set ttimeout
set ttimeoutlen=100
set ttyfast
set updatetime=300
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
	command Wq wq
	filetype plugin indent on
	let g:ale_completion_enabled=1
	let g:ale_sign_column_always=1
	let g:go_def_mode='gopls'
	let g:go_info_mode='gopls'
	let g:go_version_warning=0
	let g:goyo_width=100
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
	colorscheme landscape

	if &term =~# '256color' && ( &term =~# '^screen' || &term =~# '^tmux' )
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
	endif
endif

"=============================================================================
" Settings based on feature detection.

if has("autocmd")
	autocmd BufRead,BufNewFile *.go set noet sw=8 ts=8
	autocmd BufRead,BufNewFile *.html set et sw=2
	autocmd BufRead,BufNewFile *.md set et ft=markdown sw=2
	autocmd BufRead,BufNewFile *.opml set et sw=2
	autocmd BufRead,BufNewFile *.xml set et sw=2
	autocmd BufRead,BufNewFile *.yaml set et sw=2
	autocmd BufRead,BufNewFile *.yml set et sw=2

	" Set the colorcolumn to textwidth + 1.
	function! s:SetColorColumn()
		if &textwidth == 0
			setlocal colorcolumn=81
		else
			setlocal colorcolumn=+1
		endif
	endfunction
	augroup colorcolumn
		autocmd!
		autocmd OptionSet textwidth call s:SetColorColumn()
		autocmd BufEnter * call s:SetColorColumn()
	augroup end

endif

if has("folding")
	set nofoldenable
endif

if has("gui_running")
	if has("gui_gtk")
		set clipboard=unnamedplus
		set guifont=Monospace\ 10
	elseif has("gui_win32")
		set clipboard=unnamed
		set guifont=Consolas:h10:cANSI
		set rop=type:directx
	endif
	"set background=light
	set columns=132
	set guioptions+=cmf
	set guioptions-=T
	set lines=43
endif

if has("patch-7.3.541")
	set formatoptions+=j
endif

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

if has("printer")
	set printheader=%t%h%m%=Page\ %N
	set printoptions=paper:A4,number:y,syntax:n
endif

if has("smartindent")
	set nosmartindent
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
