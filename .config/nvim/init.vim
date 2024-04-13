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
