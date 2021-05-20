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
set joinspaces
set laststatus=2
set linebreak
set list
set listchars=tab:→·,trail:~,extends:>,precedes:<
set modelines=0
set nobackup
set noexpandtab
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
	colorscheme gruvbox

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
		set guifont=Monospace\ 11
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

if !empty($VIMCOC) && (has("patch-8.1.1719") || has("nvim")) && (executable("nodejs") || executable("node"))
	" Vim on Linux.
	let g:coc_data_home = resolve("~/.vim/coc")
	" Vim on Windows.
	if has("win32")
		let g:coc_data_home = resolve("~/vimfiles/coc")
	endif
	" NVim on Linux.
	if has("nvim")
		let g:coc_data_home = resolve("~/.config/nvim/coc")
	endif
	packadd coc.nvim

	" Give more space for displaying messages.
	set cmdheight=2

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not
	" mapped by other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	if has("nvim")
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" Make <CR> auto-select the first completion item and notify coc.nvim
	" to format on enter, <cr> could be remapped by other vim plugin
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in
	" location list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		else
			execute '!' . &keywordprg . " " . expand('<cword>')
		endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current buffer.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the
	" language server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Remap <C-f> and <C-b> for scroll float windows/popups.
	if has("nvim-0.4.0") || has("patch-8.2.0750")
		nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
		vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

	" Use CTRL-S for selections ranges.
	" Requires 'textDocument/selectionRange' support of language server.
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external
	" plugins that provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%f\ %{coc#status()}%{get(b:,'coc_current_function','')}%=%l,%c%V\ %P

	" Mappings for CoCList
	" Show all diagnostics.
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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
