" adjusting movement
noremap ; l
noremap l k
noremap k j
noremap j h

inoremap jk <ESC>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

set encoding=utf-8
set wrap
set laststatus=2
set noerrorbells
set visualbell
set background=dark
set wildignore+=.pyc,.swp
set relativenumber
set number
set number relativenumber
set tabstop=2
set autoindent

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
	if &term =~ 'xterm'
		set mouse=a
	else
		set mouse=nvi
	endif
endif

" plugin manager vim-plug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' " Git Wrapper
"Plug 'wesQ3/vim-windowswap' " Window swapper
Plug 'terryma/vim-smooth-scroll'
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
"Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
call plug#end()

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
"Revert with ":syntax off".
	syntax on
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
	set nocompatible
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Fileviewer
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

color happy_hacking
let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#enabled = 0
set noshowmode

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nmap <Leader>; :Buffers<CR>

"  <,>  --  <leader><leader> toggles between buffers
nnoremap <Leader><Leader> <c-^>

"  - |     --  Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>/ :vsp<CR>

"  w wq q   --  Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>q :q!<CR>

"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" b g H -- FZF
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>e :Files<CR>
nnoremap <Leader>H :History<CR>
