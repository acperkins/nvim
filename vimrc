runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set autoindent
set directory=.,$TEMP
set expandtab
set linebreak
set number
set printoptions=paper:A4,duplex:off,header:0
set ruler
set shiftwidth=4
set tabstop=4
set wrap
syntax on

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif

    set background=dark
    set columns=88
    set lines=40

    colorscheme solarized

endif
