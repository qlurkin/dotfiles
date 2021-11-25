" __/\\\______________/\\\________/\\\____/\\\\\\\\\_____        
"  _\/\\\_____________\/\\\_______\/\\\__/\\\///////\\\___       
"   _\/\\\_____________\/\\\_______\/\\\_\/\\\_____\/\\\___      
"    _\/\\\_____________\/\\\_______\/\\\_\/\\\\\\\\\\\/____     
"     _\/\\\_____________\/\\\_______\/\\\_\/\\\//////\\\____    
"      _\/\\\_____________\/\\\_______\/\\\_\/\\\____\//\\\___   
"       _\/\\\_____________\//\\\______/\\\__\/\\\_____\//\\\__  
"        _\/\\\\\\\\\\\\\\\__\///\\\\\\\\\/___\/\\\______\//\\\_ 
"         _\///////////////_____\/////////_____\///________\///__

"    Personal vim configuration of Quentin Lurkin <lur@ecam.be>

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set nocompatible
set encoding=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set number
set relativenumber
set cursorline
set nohlsearch
set termguicolors
set hidden
set noerrorbells
set smartcase
set noshowmode
set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set incsearch
set scrolloff=8
set signcolumn=yes
set path+=**
set mouse=a
set guifont=Fira\ Code
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right scroll bar
set guioptions-=L "remove left scroll bar
set completeopt=menu,menuone,noselect

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ce :edit ~/.config/nvim/init.vim<cr>
nmap <leader>cr :source ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :Vex<CR>
nnoremap <leader>s :Sex<CR>
nnoremap <leader>o :Ex<CR>

nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Quicky escape to normal mode
imap ii <esc>
vmap ii <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

nmap <leader>p "*p

" Convenient for my belgian keyboard layout
nnoremap ç {
nnoremap à }
nnoremap ) ^
nnoremap - $
nnoremap <C-)> <C-^>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vimfiles/plugged')

source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/lsp.vim
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/floatterm.vim
source ~/.config/nvim/plugins/vim-be-good.vim

call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------