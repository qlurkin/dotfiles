Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

lua << EOF
	function _G.configTreesitter()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = "maintained",
			highlight = { 
				enable = true
			}
		}
	end
EOF

augroup HighlightEnable
	autocmd!
	autocmd User PlugLoaded ++nested call v:lua.configTreesitter()
augroup end
