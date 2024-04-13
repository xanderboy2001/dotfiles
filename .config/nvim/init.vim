call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-commentary'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'yggdroot/indentline'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/vim-easy-align'
    Plug 'tmhedberg/simpylfold'
call plug#end()

set shiftwidth=4
set number
colorscheme dracula


let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
