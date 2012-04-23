" Personal ~/.vimrc
" Matthew Nelson <mnelson@vitalvector.com>

" Looking forward
set nocompatible backspace=indent,eol,start encoding=utf-8

" Tabbing
set expandtab shiftwidth=2 tabstop=2 softtabstop=2 autoindent

if has("autocmd")

  filetype plugin indent on

  " Custom filetype settings
  autocmd FileType java,gitconfig setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

  " Custom filetype detection
  autocmd BufNewFile,BufRead *.inc setfiletype php
  autocmd BufNewFile,BufRead *.mako setfiletype mako

endif

" Syntax highlighting
if has("syntax") && (&t_Co > 2 || has("gui_running"))
  syntax on
endif

" Spell checking
if has("spell")
  set spell
endif

let mapleader=","

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
set background=dark

" Windows
" set winwidth=79 winheight=5 winminheight=5 winheight=999
set winwidth=79

" Search
set incsearch hlsearch ignorecase smartcase

" Disable bell
set visualbell t_vb=

" Disable double spaces when joining after punctuation
set nojoinspaces

" Eliminate fsync pauses during regular editing
set swapsync=

" Transparency
if has("transparency")
  set transparency=10
endif

if has("gui_running")

  " Disable menus and toolbars
  set guioptions=aceg

  " Desert color scheme
  colorscheme solarized

  " Change font
  set guifont=DejaVu\ Sans\ Mono\ 10,Menlo\ Regular:h12

endif

" CommandT
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT app/templates<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
if has("gui_macvim") && has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandTFlush<cr>\|:CommandT<cr>
endif
