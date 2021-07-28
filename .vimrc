if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"""""""""""My Rules"""""""""""""""""""""

set title
set nobackup
set noswapfile
set showcmd

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set wrapscan

"カーソル
set whichwrap=b,s,h,l,<,>,[,]

set modifiable
set write

"マウス有効
"set mouse=a

"下余白
set scrolloff=3

"検索
set ignorecase
set smartcase
set hlsearch
nnoremap <F3> :nohlsearch<CR>

"visual
set number
set nowrap
set cursorline
hi clear CursorLine

augroup vim_loaded
    autocmd!
    autocmd BufNewFile *.py 0put='#!/usr/bin/env python3'
    autocmd BufNewFile *.py 1put='# -*- coding: utf-8 -*-'
    autocmd BufNewFile *.py 3;
augroup END

"カラースキーム指定
""""""""""""""""molokai""""""""""""""
syntax on
set t_Co=256
colorscheme molokai
"""""""""""""""""""""""""""""""""""""


""プラグイン
"call plug#begin()
""nerdtree
"Plug 'scrooloose/nerdtree'
""tcomment
"Plug 'tomtom/tcomment_vim'
"call plug#end()
