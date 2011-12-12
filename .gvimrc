" Personal ~/.gvimrc
" Matthew Nelson <mnelson@vitalvector.com>

" Transparency
if has("transparency")
  set transparency=10
endif

" Disable menus and toolbars
set guioptions=aceg

" Desert color scheme
colorscheme solarized

" Change font
set guifont=DejaVu\ Sans\ Mono\ 10,Menlo\ Regular:h12

" Disable visual bell (again)
set t_vb=

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
endif
