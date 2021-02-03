set nocompatible
set encoding=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set number
set cursorline
set nohlsearch
set hidden
set noerrorbells
set smartcase
set noswapfile
set nobackup
set undodir=~/vimfiles/undodir
set incsearch
set scrolloff=8
set signcolumn=yes
set path+=**

call plug#begin('~/vimfiles/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

colorscheme gruvbox
set background=dark

let g:netrw_liststyle = 3

command! Format execute 'lua vim.lsp.buf.formatting()'

set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" lua << EOF
" 	local lspconfig = require('lspconfig')
" 	local on_attach = function(_, bufnr)
" 		require('completion').on_attach()
" 	end
" 	local servers = {'denols', 'clangd', 'jsonls', 'cmake', 'omnisharp', 'pyright', 'vimls'}
" 	for _, lsp in ipairs(servers) do
" 		lspconfig[lsp].setup{
" 			on_attach = on_attach
" 		}
" 	end
" EOF

let mapleader = " "

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  require('completion').on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    require('lspconfig').util.nvim_multiline_command [[
      :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {'denols', 'clangd', 'jsonls', 'cmake', 'omnisharp', 'pyright', 'vimls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

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


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>u :undotreeshow<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <C-b> :Ex<CR>
nnoremap <C-n> :Vex<CR>

" Convenient for my belgian keyboard layout
nnoremap ç {
nnoremap à }
nnoremap ù ^
nnoremap µ $
nnoremap <C-ù> <C-^>
