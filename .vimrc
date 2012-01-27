" Personal ~/.vimrc
" Matthew Nelson <mnelson@vitalvector.com>

" Looking forward
set nocompatible backspace=2 encoding=utf-8

" Tabbing
set smarttab shiftwidth=2 tabstop=2 softtabstop=2 expandtab

filetype plugin indent on

" Custom filetype settings
autocmd FileType php,mako,perl setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType java setlocal noexpandtab shiftwidth=4, tabstop=4, softtabstop=4

" Custom filetype detection
autocmd BufNewFile,BufRead *.inc setfiletype php
autocmd BufNewFile,BufRead *.mako setfiletype mako

" Syntax highlighting
if has("syntax")
  syntax on
  " autocmd BufEnter * syntax sync fromstart
endif

" Spell checking
if has("spell")
  set spell
endif

" Disable HTML rendering (bold, underline, etc)
let html_no_rendering=1

" Disable matching parenthesis highlighting in VIM 7
" See :help pi_paren.txt
let loaded_matchparen=1

" List mode
set list listchars=tab:>\ ,trail:~,nbsp:%,extends:>,precedes:<

" Side scrolling
set nowrap sidescroll=8

" Display options
set ruler showmode showcmd number showmatch wildmenu cursorline
set title titlestring=%F
set background=light

" Incremental search
set incsearch hlsearch ignorecase smartcase

" Disable bell
set visualbell t_vb=

" Disable double spaces when joining after punctuation
set nojoinspaces

" Eliminate fsync pauses during regular editing
set swapsync=
