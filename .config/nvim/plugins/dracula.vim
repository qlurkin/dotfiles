Plug 'dracula/vim', { 'as': 'dracula' }

augroup DraculaEnable
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end
