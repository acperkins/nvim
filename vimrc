" Anthony Perkins
" https://github.com/acperkins/vimfiles
"
" Distributed under the VIM license. See ':help license' for a copy. Files under
" pack/ have their own licenses.
"
" Includes parts from Tim Pope's «sensible.vim»
" <https://github.com/tpope/vim-sensible>.

"===============================================================================
" Set this first to avoid overwriting later settings.
set nocompatible

"===============================================================================
" Load Pathogen if Vim does not support packages.
if !has('packages')
    runtime pack/acp/opt/vim-pathogen/autoload/pathogen.vim
    execute pathogen#infect('pack/acp/start/{}')
endif

"===============================================================================
" General settings for all builds.

" Set colour levels for different terminals.
set t_Co=256
set termguicolors

" Disable arrow keys.
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

inoremap <C-BS> <C-W>
inoremap <C-a> <C-O>^
inoremap <C-e> <C-O>$
inoremap <F11> <C-O>:call ACPToggleMargins()<CR>
inoremap <F12> <C-\><C-O>:w<CR>
inoremap <F2> TODO:<Space>
inoremap <F9> <C-R>=strftime('%Y-%m-%dT%H:%M')<CR>
inoremap <S-F11> <C-O>:call ACPToggleMargins()<CR>
inoremap <S-F2> #*TODO:*#<Space>

nnoremap <F10> :Limelight!!<CR>
nnoremap <F11> :call ACPToggleMargins()<CR>
nnoremap <F12> :w<CR>
nnoremap <F2> :call ACPActodoTodo()<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :vsplit<CR>
nnoremap <F7> :call ACPToggleSpellEnUs()<CR>
nnoremap <F9> :%!clang-format<CR>
nnoremap <Leader>B :bprevious<CR>
nnoremap <Leader>b :bnext<CR>
nnoremap <Leader>d <Plug>(coc-definition)
nnoremap <S-F11> :call ACPToggleMargins()<CR>
nnoremap <S-F2> :call ACPAdocTodo()<CR>
nnoremap <S-F4> :split<CR>
nnoremap <S-F7> :call ACPToggleSpellEnGb()<CR>

vnoremap <F9> :!clang-format<CR>

map <C-ScrollWheelDown> <C-F>
map <C-ScrollWheelUp> <C-B>
map <S-ScrollWheelDown> <C-E>
map <S-ScrollWheelUp> <C-Y>
map <ScrollWheelDown> 3<C-E>
map <ScrollWheelUp> 3<C-Y>

" Text wrapping and margin settings. Setting tw=72 is ideal for emails or
" anything that will be read in a Terminal, while tw=100 is better for code or
" for general text that will be viewed in a GUI. If printing, an A4-sized page
" should fit 100 columns at 8pt or 80 columns at 10pt, in Courier or Liberation
" Mono fonts.
"
" You can highlight line-end columns with colorcolumn (cc), which should be one
" larger than the textwidth. E.g. to include a 'margin-bell' line also:
"     set tw=80 cc=73,81
" Clear the colorcolumn highlighting with cc=0.
set colorcolumn=0
set textwidth=0  " Suggestions: 72, 80, 100

" All other settings.
set autoindent
set autoread
set backspace=indent,eol,start
set cmdheight=1
set directory=$TEMP//,/tmp//,.
set display+=lastline
set encoding=utf-8
set expandtab
set formatoptions-=t
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=trail:·,extends:→,precedes:←,nbsp:␣
set modelines=0
set nobackup
set nojoinspaces
set nomodeline
set nonumber
set nowritebackup
set nrformats-=octal
set numberwidth=8
set relativenumber
set ruler
set scrolloff=5
set sessionoptions-=options
set shiftwidth=4
set shortmess+=c
set smartcase
set smarttab
set spl=en_gb nospell
set splitbelow
set splitright
set tabstop=8
set ttimeout
set ttimeoutlen=100
set ttyfast
set updatetime=300
set wrap

" Set theme for Terminal.
set background=dark
colorscheme tempus_night

"===============================================================================
" General settings for non-minimal Vim builds.

if has('eval')
    " Protect commands that are only available when +eval is enabled.
    " Technically only 'if 1' would be required, as 'has()' is provided by
    " +eval, but this is clearer.

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
    let g:limelight_default_coefficient=0.8
    let g:nroff_is_groff=1
    let g:org_indent=0
    let g:org_tag_column=78
    let g:tempus_enforce_background_color=1

    let loaded_netrwPlugin=1  " Disable netrw completely.

    function! ACPToggleMargins()
        execute "set colorcolumn=" . (&colorcolumn == "0" ? "73,81" : (&colorcolumn == "73,81" ? "101" : "0"))
        execute "set textwidth=" . (&colorcolumn == "73,81" ? "80" : (&colorcolumn == "101" ? "100" : "0"))
        echo "tw=" . &textwidth . " & cc=" . &colorcolumn
    endfunction

    function! ACPToggleSpellEnUs()
        if &spell == 0
            setlocal spell spelllang=en_us
            echo "Spelling ON (en_US)"
        else
            setlocal nospell
            echo "Spelling OFF"
        endif
    endfunction

    function! ACPToggleSpellEnGb()
        if &spell == 0
            setlocal spell spelllang=en_gb
            echo "Spelling ON (en_GB)"
        else
            setlocal nospell
            echo "Spelling OFF"
        endif
    endfunction

    function! ACPActodoTodo()
        " Toggles between TODO, WORK, WAIT, DONE, and blank.
        " All are highlighted except DONE and blank.
        " Must be at the start of the line, optionally preceeded with
        " whitespace. This makes it work for actodo lists.
        if getline(line(".")) =~# "TODO: "
            s/^\(\s*\)TODO: /\1WORK: /e
            echo " Blank  ->  TODO  -> [WORK] ->  WAIT  ->  DONE "
        elseif getline(line(".")) =~# "WORK: "
            s/^\(\s*\)WORK: /\1WAIT: /e
            echo " Blank  ->  TODO  ->  WORK  -> [WAIT] ->  DONE "
        elseif getline(line(".")) =~# "WAIT: "
            s/^\(\s*\)WAIT: /\1DONE: /e
            echo " Blank  ->  TODO  ->  WORK  ->  WAIT  -> [DONE]"
        elseif getline(line(".")) =~# "DONE: "
            s/^\(\s*\)DONE: /\1/e
            echo "[Blank] ->  TODO  ->  WORK  ->  WAIT  ->  DONE "
        else
            s/^\(\s*\)/\1TODO: /e
            echo " Blank  -> [TODO] ->  WORK  ->  WAIT  ->  DONE "
        endif
    endfunction

    function! ACPAdocTodo()
        " Toggles between TODO, WORK, WAIT, DONE, and blank.
        " All are highlighted except DONE and blank.
        " Must be at the start of the line, optionally preceeded with an
        " asterisk and a space. This makes it work for Asciidoc lists.
        if getline(line(".")) =~# "[#][*]TODO:[*][#] "
            s/^\(\**\s*\)#\*TODO:\*# /\1#*WORK:*# /e
            echo " Blank  ->  TODO  -> [WORK] ->  WAIT  ->  DONE "
        elseif getline(line(".")) =~# "[#][*]WORK:[*][#] "
            s/^\(\**\s*\)#\*WORK:\*# /\1#*WAIT:*# /e
            echo " Blank  ->  TODO  ->  WORK  -> [WAIT] ->  DONE "
        elseif getline(line(".")) =~# "[#][*]WAIT:[*][#] "
            s/^\(\**\s*\)#\*WAIT:\*# /\1*DONE:* /e
            echo " Blank  ->  TODO  ->  WORK  ->  WAIT  -> [DONE]"
        elseif getline(line(".")) =~# "[*]DONE:[*] "
            s/^\(\**\s*\)\*DONE:\* /\1/e
            echo "[Blank] ->  TODO  ->  WORK  ->  WAIT  ->  DONE "
        else
            s/^\(\**\s*\)/\1#*TODO:*# /e
            echo " Blank  -> [TODO] ->  WORK  ->  WAIT  ->  DONE "
        endif
    endfunction

endif

"===============================================================================
" Settings based on feature detection.

" Set theme for GUI.
if has('gui_running')
    set background=light
    colorscheme tempus_totus
endif

if has('autocmd')
    autocmd BufRead,BufNewFile * set omnifunc=syntaxcomplete#Complete
    autocmd BufRead,BufNewFile *.go set noet sw=8 ts=8
    autocmd BufRead,BufNewFile *.html set et sw=2 indk=
    autocmd BufRead,BufNewFile *.md set et ft=markdown sw=2
    autocmd BufRead,BufNewFile *.opml set et sw=2
    autocmd BufRead,BufNewFile *.ps1 set et sw=4 ts=4
    autocmd BufRead,BufNewFile *.rs set et sw=4
    autocmd BufRead,BufNewFile *.txt set et sw=3 tw=72
    autocmd BufRead,BufNewFile *.xml set et sw=2
    autocmd BufRead,BufNewFile *.yaml set et sw=2
    autocmd BufRead,BufNewFile *.yml set et sw=2
endif

if has('folding')
    set nofoldenable
endif

if has('gui_running')
    if has('gui_gtk')
        set clipboard=unnamedplus
        set guifont=Monospace\ 10
    elseif has('gui_win32')
        set clipboard=unnamed
        set guifont=Cascadia_Code_SemiLight:h10:W350:cANSI:qDRAFT
        set rop=type:directx
    endif
    set columns=132
    set guioptions+=c
    set guioptions+=m
    set guioptions-=T
    set guioptions-=f
    set lines=43
endif

if has('linebreak')
    set breakindent
endif

if has('mouse_sgr')
    set ttymouse=sgr
end

if has('patch-7.3.541')
    set formatoptions+=j
endif

if has('patch-8.1.0759')
    set listchars+=tab:┆  
else
    set listchars+=tab:┆ 
endif

if has('patch-8.1.1564')
    set signcolumn=number
else
    set signcolumn=yes
endif

if has('patch-9.0.0640')
    set smoothscroll
endif

if has('printer')
    set printheader=%t%h%m%=Page\ %N
    set printoptions=paper:A4,number:y,syntax:n
endif

if has('smartindent')
    set nosmartindent
endif

if has('syntax')
    syntax on
endif

if has('viminfo')
    set viminfo="NONE"
endif

if has('wildmenu')
    set wildmenu
endif

if has("patch-8.1.1719") && (executable("nodejs") || executable("node"))
    packadd coc.nvim
endif

" Keep this as the last config line in the file.
runtime vimrc.local

"===============================================================================
" End of config file.
" vim:set ft=vim:
