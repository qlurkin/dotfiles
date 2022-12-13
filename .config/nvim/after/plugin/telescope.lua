vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set('n', "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set('n', "<leader>ft", "<cmd>Telescope toggleterm<cr>")
require("telescope").load_extension "toggleterm"
require("telescope-toggleterm").setup {
   telescope_mappings = {
      -- <ctrl-c> : kill the terminal buffer (default) .
      ["<C-c>"] = require("telescope-toggleterm").actions.exit_terminal,
   },
}

