" Anthony Perkins
" https://github.com/acperkins/vimfiles
" Distributed under the VIM license. See ':help license' for a copy.
"
" Includes parts from Tim Pope's «sensible.vim»
" <https://github.com/tpope/vim-sensible>.

if version < 800
    silent! runtime pack/acp/opt/vim-pathogen/autoload/pathogen.vim
    silent! execute pathogen#infect('pack/acp/start/{}')
endif

autocmd BufRead,BufNewFile *.md set filetype=markdown
command Q q
command W w
command WQ wq
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_winsize=-28
let g:riv_fold_auto_update=0
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
nnoremap <up>    <nop>
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set colorcolumn=73
set complete-=i
set cursorcolumn
set cursorline
set directory=$TEMP//,/tmp//,.
set display+=lastline
set encoding=utf-8
set expandtab
set guioptions+=c
set guioptions-=m
set guioptions-=T
set history=1000
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set modelines=0
set nofoldenable
set nojoinspaces
set nrformats-=octal
set number
set omnifunc=syntaxcomplete#Complete
set printoptions=paper:A4,duplex:off,header:0
set relativenumber
set ruler
set sessionoptions-=options
set shiftwidth=4
set smartcase
set smarttab
set spl=en_gb nospell
set tabstop=4
set textwidth=72
set ttimeout
set ttimeoutlen=100
set ttyfast
set viminfo="NONE"
set wildmenu
set wrap
silent! colorscheme desert
silent! filetype plugin indent on
silent! syntax on

if has("patch-7.3.541")
    set formatoptions+=j
endif

if has("patch-7.4.710")
    set listchars=eol:¶,tab:→ ,trail:~,extends:>,precedes:<,space:·
else
    set listchars=eol:¶,tab:→ ,trail:~,extends:>,precedes:<
endif

if has("lua")
    let g:neocomplete#enable_at_startup=1
endif

if !empty(&viminfo)
    set viminfo^=!
endif

if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ Regular\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif

    set columns=88
    set lines=40

    try
        colorscheme jellybeans
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme darkblue
    endtry

endif

" vim:set ft=vim et sw=4:
