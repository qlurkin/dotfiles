Plug 'itchyny/lightline.vim'

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

