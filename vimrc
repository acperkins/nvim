" Anthony Perkins
" https://github.com/acperkins/vimfiles
" Distributed under the VIM license. See ':help license' for a copy.
"
" Includes parts from Tim Pope's «sensible.vim»
" <https://github.com/tpope/vim-sensible>.

" ======================================================================
" Load Pathogen if Vim does not support packages.
if !has("packages")
    runtime pack/acp/opt/vim-pathogen/autoload/pathogen.vim
    execute pathogen#infect('pack/acp/start/{}')
endif

" ======================================================================
" General settings for all builds.

inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
nmap <F7> :setlocal spell! spelllang=en_gb<CR>
nmap <F11> :Goyo<bar>:Limelight!!<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-Up>    :wincmd k<CR>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
nnoremap <up>    <nop>
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set colorcolumn=73,81
set complete-=i
set directory=$TEMP//,/tmp//,.
set display+=lastline
set encoding=utf-8
set expandtab
set history=1000
set ignorecase
set incsearch
set joinspaces
set laststatus=2
set linebreak
set list
set listchars=tab:→·,trail:~,extends:>,precedes:<
set modeline
set modelines=1
set nocompatible
set nrformats-=octal
set number
set numberwidth=8
set omnifunc=syntaxcomplete#Complete
set relativenumber
set ruler
set sessionoptions-=options
set shiftwidth=4
set smartcase
set smarttab
set spl=en_gb nospell
set tabstop=8
set textwidth=72
set ttimeout
set ttimeoutlen=100
set ttyfast
set viminfo="NONE"
set wildmenu
set wrap

" ======================================================================
" General settings for non-minimal Vim builds.

if has("eval")
    " Protect commands that are only available when +eval is enabled.
    " Technically only "if 1" would be required, as "has()" is provided
    " by +eval, but this is clearer.
    colorscheme gruvbox
    command Q q
    command W w
    command WQ wq
    filetype plugin indent on
    let g:netrw_altv=1
    let g:netrw_banner=0
    let g:netrw_browse_split=4
    let g:netrw_liststyle=3
    let g:netrw_sort_sequence='[\/]$,*'
    let g:netrw_winsize=-28
    let g:org_tag_column=72
    " Disable vim-go warning on CentOS
    let g:go_version_warning = 0
    " Set colour levels for different terminals.
    if &term == "rxvt-unicode"
        set t_Co=256
    elseif &term == "xterm"
        set t_Co=256
    elseif &term == "linux"
        set t_Co=16
    else
        set t_Co=16
    endif
endif

" ======================================================================
" Settings based on feature detection.

if has("autocmd")
    autocmd BufRead,BufNewFile *.go set noexpandtab
    autocmd BufRead,BufNewFile *.go set shiftwidth=8
    autocmd BufRead,BufNewFile *.go set tabstop=8
    autocmd BufRead,BufNewFile *.html set shiftwidth=2
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.md set tabstop=4
    autocmd BufRead,BufNewFile *.opml set shiftwidth=2
    autocmd BufRead,BufNewFile *.xml set shiftwidth=2
    autocmd BufRead,BufNewFile *.yml set shiftwidth=2
endif

if has("folding")
    set nofoldenable
endif

if has("gui_running")
    if has("gui_gtk2") || has("gui_gtk3")
        set clipboard=unnamedplus
        set guifont=Liberation\ Mono\ 11,
                    \Monospace\ Regular\ 11
    elseif has("gui_win32")
        set clipboard=unnamed
        set guifont=Source_Code_Pro:h9:cANSI:qDRAFT,
                    \Consolas:h10:cANSI
    endif
    set columns=88
    set guioptions+=c
    set guioptions+=m
    set guioptions-=T
    set lines=40
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

" ======================================================================
" End of config file.
" vim:set ft=vim et sw=4:
