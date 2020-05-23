syntax on

set nocompatible
set encoding=utf-8
set relativenumber
set number
set noerrorbells visualbell t_vb=
set belloff=all
set cul
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/vimfiles/undodir
set undofile
set incsearch
set t_Co=256
set noshowmode
set laststatus=2
set path+=**
set wildmenu
set backspace=2
set hidden

call plug#begin('~/vimfiles/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" Plug 'jremmen/vim-ripgrep'
" Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

let g:lightline = {
	\ 'colorscheme': 'darcula',
	\ 'active': {
	\	'left': [
	\		['mode', 'paste'],
	\		['gitbranch', 'readonly', 'filename', 'modified']
	\	]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'FugitiveHead'
	\ }
	\ }

" if executable('rg')
" 	let g:rg_derive_root='true'
" endif

let mapleader = ","

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>u :undotreeshow<CR>
nnoremap <leader>v :vsplit<CR>

" nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>: :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>