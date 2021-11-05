set nocompatible
set encoding=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set number
" set cursorline
set nohlsearch
set hidden
set noerrorbells
set smartcase
set noswapfile
set nobackup
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

call plug#begin('~/vimfiles/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

set background=dark

let g:netrw_liststyle = 3

set completeopt=menu,menuone,noselect

lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }
    }, {
      { name = 'buffer' }
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local nvim_lsp = require('lspconfig')
  local servers = { 'pyright', 'clangd' }

  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities
    }
  end
EOF

let g:lightline = {
  \ 'colorscheme': 'darcula',
  \ 'active': {
  \ 'left': [
  \   ['mode', 'paste'],
  \   ['gitbranch', 'readonly', 'filename', 'modified']
  \ ]
  \ },
  \ 'component_function': {
  \ 'gitbranch': 'FugitiveHead'
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Normal           guifg=#dfdfdf guibg=#282c34
highlight LineNr           guifg=#5b6268 guibg=#282c34
highlight CursorLineNr     guifg=#202328 guifg=#5b6268
highlight VertSplit        guifg=#1c1f24 guifg=#5b6268
highlight Statement        guifg=#98be65 guibg=none
highlight Directory        guifg=#51afef guibg=none
highlight StatusLine       guifg=#202328 guifg=#5b6268
highlight StatusLineNC     guifg=#202328 guifg=#5b6268
highlight NERDTreeClosable guifg=#98be65
highlight NERDTreeOpenable guifg=#5b6268
highlight Comment          guifg=#51afef guibg=none
highlight Constant         guifg=#3071db guibg=none
highlight Special          guifg=#51afef guibg=none
highlight Identifier       guifg=#5699af guibg=none
highlight PreProc          guifg=#c678dd guibg=none
highlight String           guifg=#3071db guibg=none
highlight Number           guifg=#ff6c6b guibg=none
highlight Function         guifg=#ff6c6b guibg=none
highlight Visual           guifg=#dfdfdf guibg=#1c1f24
highlight Pmenu            guifg=#cccccc guibg=#000000
