" adjusting movement
noremap ; l
noremap l k
noremap k j
noremap j h

inoremap jk <ESC>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Quick change buffer
nnoremap <Leader>b :ls<CR>:b<Space>

filetype plugin on
set encoding=utf-8
set wrap
set laststatus=2
set noerrorbells
set visualbell
set background=dark
set wildignore+=.pyc,.swp
set number
set relativenumber
set hlsearch
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

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let macvim_skip_colorscheme=1
colorscheme happy_hacking

" Statusbar powered by lightline
let g:lightline = {
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename'
                \ }
                \ }
        function! LightlineModified()
                return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        endfunction
        function! LightlineReadonly()
                return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
        endfunction
        function! LightlineFilename()
                return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
                \ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft ==# 'unite' ? unite#get_status_string() :
                \  &ft ==# 'vimshell' ? vimshell#get_status_string() :
                \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
                \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
        endfunction
        function! LightlineFugitive()
                if &ft !~? 'vimfiler' && exists('*FugitiveHead')
                        return FugitiveHead()
                endif
                return ''
        endfunction

set noshowmode

" Vimwiki
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'default'
let wiki_1.ext = '.wiki'

let wiki_2 = {}
let wiki_2.path = '~/privatewiki/'
let wiki_2.syntax = 'default'
let wiki_2.ext = '.wiki'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.wiki': 'default'}
let g:vimwiki_folding = 'expr'

" Pandoc
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#mode = ["syntax"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc"]
let g:pandoc#formatting#mode = "h"
let g:pandoc#syntax#conceal#use = 2
let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'vim', 'make',
            \  'bash=sh', 'html', 'css', 'scss', 'javascript']
let maplocalleader = ";"

" emmet-vim html editing
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

