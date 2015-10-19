silent! runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! execute pathogen#infect()

set autoindent
set background=dark
set colorcolumn=72
set cursorcolumn
set cursorline
set directory=.,$TEMP
set encoding=utf-8
set expandtab
set ignorecase
set linebreak
set list
set listchars="tab:> ,trail:$,extends:>,precedes:<,nbsp:+"
set modelines=0
set number
set omnifunc=syntaxcomplete#Complete
set printoptions=paper:A4,duplex:off,header:0
set relativenumber
set ruler
set shiftwidth=4
set smartcase
set spl=en_gb spell
set tabstop=4
set textwidth=72
set ttyfast
set wrap
silent! colorscheme desert
silent! filetype plugin indent on
silent! syntax on

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif

    set columns=88
    set lines=40

    try
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme darkblue
    endtry

endif
