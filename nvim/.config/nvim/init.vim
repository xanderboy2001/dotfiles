" Fix runtime path for Lua modules
set runtimepath+=~/.vim/plugged/nvim-treesitter

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
		Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'junegunn/vim-easy-align'
		Plug 'mg979/vim-visual-multi', {'branch': 'master'}
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-sensible'
		Plug 'tpope/vim-surround'
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'

		" Python & LSP Plugins
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/mason.nvim'
		Plug 'williamboman/mason-lspconfig.nvim'
		Plug 'stevearc/conform.nvim'									" Black Formatter
		Plug 'hrsh7th/nvim-cmp'												" Autocomplete engine
		Plug 'hrsh7th/cmp-nvim-lsp'										" LSP source for autocompletion
		Plug 'L3MON4D3/LuaSnip'												" Snippet engine
		Plug 'lukas-reineke/indent-blankline.nvim'		" Modern Indent Guides (PEP 8)
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Basic Settings
set shiftwidth=2
set number
colorscheme dracula
set clipboard=unnamedplus


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

" Enable Airline integration with LSP
let g:airline#extensions#lsp#enabled = 1
let g:airline#extensions#nvimlsp#enabled = 1

" Customize symbols for PEP 8 errors/warnings
let g:airline#extensions#nvimlsp#error_symbol = ' '
let g:airline#extensions#nvimlsp#warning_symbol = ' '

" --- New Lua Configuration Block ---
lua << EOF
-- 1. Setup Mason to auto-install Python tools
require("mason").setup()
require("mason-lspconfig").setup({
		ensure_installed = { "pyright", "ruff" }
})

-- 2. LSP Setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Pyright
vim.lsp.config('pyright', {
		capabilities = capabilities,
})
vim.lsp.enable('pyright')

-- Setup Ruff
vim.lsp.config('ruff', {
		capabilities = capabilities,
})
vim.lsp.enable('ruff')

-- 3. Conform Setup (Black for PEP 8 formatting)
require("conform").setup({
		formatters_by_ft = {
				python = { "black" },
		},
		format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
		},
})

-- 4. Indent Guides
require("ibl").setup()

-- 5. Treesitter (Better Highlighting)
require'nvim-treesitter'.setup {
	install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'python', 'lua', 'vim', 'vimdoc' } 

-- 6. Autocomplete Keymaps
local cmp = require("cmp")
cmp.setup({
		snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
		mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
		}),
		sources = cmp.config.sources({{ name = 'nvim_lsp' }})
})
EOF

" LSP Keybonds
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>



" script templates
augroup script_templates
		autocmd!
		" When starting a new file ending in .sh, read skeleton file
		autocmd BufNewFile *.sh 0read ~/.config/nvim/templates/bash_skeleton.sh | normal! G
augroup END

" script permissions
augroup script_permissions
		autocmd!
		" Make .sh scripts executable when we save it
		autocmd BufWritePost *.sh silent! !chmod +x %
augroup END


" Make LSP diagnostics look better with Dracula
highlight DiagnosticUnderlineError gui=undercurl guisp=#ff5555
highlight DiagnosticUnderlineWarn gui=undercurl guisp=#ffb86c
highlight DiagnosticSignError guifg=#ff5555
highlight DiagnosticSignWarn guifg=#ffb86c
