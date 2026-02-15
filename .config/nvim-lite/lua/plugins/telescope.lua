return {
    'nvim-telescope/telescope.nvim',
    version = 'v0.2.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find Files (Root Dir)" },
        { "<leader>b", "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>", desc = "Pick Buffers" },
        { "<leader>?", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
        { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
        { "<leader>c", "<cmd>Telescope colorscheme<cr>", desc = "Pick Colorscheme" },
        { "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    },
    opts = {
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    }
}
