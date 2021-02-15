" Use Vim settings, rather than Vi settings (much better!).

" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
,set nocompatible
endif

" Adjusting HJKL to diamond keys | on laptop substituted with karabiner rule change fn +
" diamond keys otherwise on UHK via mod + diamond keys
"noremap ; l
"noremap l k
"noremap k j
"noremap j h

inoremap jk <ESC>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"  <,>  --  <leader><leader> toggles between buffers
nnoremap <Leader><Leader> <c-^>

"  - |     --  Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>/ :vsp<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <Leader>´ :Startify<CR>
nnoremap <Leader>´z :vsp ~/.zshrc<CR>
nnoremap <Leader>´v :vsp ~/.vimrc<CR>
nnoremap <Leader>rv :source ~/.vimrc<CR>

"  w wq q   --  Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :q!<CR>

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
nnoremap <Leader>h :History<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdj :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" General settings
set encoding=UTF-8
set wrap
set laststatus=2
set noerrorbells
set visualbell
set background=dark
set wildignore+=.pyc,.swp
set number
set relativenumber
set tabstop=2
set autoindent
set updatetime=100
set ignorecase
set smartcase
set incsearch
set cmdheight=2
set hlsearch
set confirm

" NERDCommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

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
 
" fuzzy finder
set rtp+=/usr/local/opt/fzf

" plugin manager vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim' " Git commit browser
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'
"Plug 'wesQ3/vim-windowswap' " Window swapper
Plug 'axvr/org.vim'
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'easymotion/vim-easymotion'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
call plug#end()

" Orgmod
let g:org_clean_folds = 1

" Git commit browser
let g:fugitive_gitlab_domains = ['https://gitlab.bepartners.pro']

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
"Revert with ":syntax off".
	syntax on
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Show @@@ in the last line if it is truncated.
set display=truncate

" Fileviewer Nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nnoremap <Leader>f :NERDTreeToggle<Enter>
" nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Look n feel
color happy_hacking
" autocmd vimenter * ++nested colorscheme gruvbox
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
let g:airline_theme='powerlineish'
" let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#enabled = 0
set noshowmode
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set termguicolors
set t_ut=

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" Startify
let g:ascii = [
          \ '        __',
          \ '.--.--.|__|.--------.',
          \ '|  |  ||  ||        |',
          \ ' \___/ |__||__|__|__|',
          \ ''
          \]

let g:startify_custom_header =
      \ 'startify#pad(g:ascii + startify#fortune#boxed())'

