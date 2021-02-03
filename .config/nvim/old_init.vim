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
set nowritebackup
set undodir=~/vimfiles/undodir
set undofile
set t_Co=256
set noshowmode
set laststatus=2
set path+=**
set wildmenu
set hidden
set cmdheight=2
set nohlsearch
set scrolloff=8

call plug#begin('~/vimfiles/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'preservim/nerdtree'
" Plug 'herrbischoff/cobalt2.vim'
Plug 'flazz/vim-colorschemes'
Plug '907th/vim-auto-save'

call plug#end()

let g:auto_save = 1  " enable AutoSave on Vim startup

let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
set background=dark

" let g:netrw_browse_split = 2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25
let g:netrw_liststyle = 3

let g:lightline = {
	\ 'colorscheme': 'darcula',
	\ 'active': {
	\	'left': [
	\		['mode', 'paste'],
	\		['gitbranch', 'readonly', 'filename', 'modified', 'cocstatus']
	\	]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'FugitiveHead',
    \   'cocstatus': 'coc#status'
	\ }
	\ }

if executable('rg')
	let g:rg_derive_root='true'
endif

" map <C-b> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''

let mapleader = ","

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>u :undotreeshow<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <C-b> :Ex<CR>
nnoremap <C-n> :Vex<CR>

" Convenient for my belgian keyboard layout
nmap ç {
nmap à }
nmap ù ^
nmap µ $
nmap <C-ù> <C-^>

" COC CONFIG

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-emmet',
	\ 'coc-highlight',
	\ 'coc-lists',
	\ 'coc-git',
	\ 'coc-yank',
	\ 'coc-python',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-tabnine',
	\ 'coc-json',
	\ ]

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
