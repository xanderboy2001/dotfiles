let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'junegunn/vim-easy-align'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'yggdroot/indentline'
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

set clipboard=unnamedplus


" script templates
augroup script_templates
		autocmd!
		" When starting a new file ending in .sh, read skeleton file
		autocmd BufNewFile *.sh 0read ~/.config/nvim/templates/bash_skeleton.sh | !normal G
augroup END

" script permissions
augroup script_permissions
		autocmd!
		" Make .sh scripts executable when we save it
		autocmd BufWritePost *.sh silent! !chmod +x %
augroup END
