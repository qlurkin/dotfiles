-- local neogit = require('neogit')

-- neogit.setup {}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

vim.keymap.set('n', '<leader>gg', '<cmd>Neotree git_status focus<cr>')
