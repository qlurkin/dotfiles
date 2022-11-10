-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'
    use {'catppuccin/nvim', as = 'catppuccin' } 
    use { 'rose-pine/neovim', as = 'rose-pine' } 
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-tree/nvim-web-devicons'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
--    use 'jose-elias-alvarez/null-ls.nvim'
--    use 'williamboman/mason.nvim'
--    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'kdheepak/cmp-latex-symbols'
--    use 'simrat39/inlay-hints.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'Pocco81/auto-save.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'j-hui/fidget.nvim'
    use 'TimUntersberger/neogit'
    use 'numToStr/Comment.nvim'
    use 'akinsho/toggleterm.nvim'
end)
