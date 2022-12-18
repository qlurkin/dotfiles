local tb = require('telescope.builtin')

vim.keymap.set('n', "<leader>ff", tb.find_files, {desc = '[F]ind [F]iles'})
vim.keymap.set('n', "<leader>fg", tb.live_grep, {desc = '[F]ind by [G]rep'})
vim.keymap.set('n', "<leader><space>", tb.buffers, {desc = '[ ] Find Buffers'})
vim.keymap.set('n', "<leader>fh", tb.help_tags, {desc = '[F]ind [H]elp'})
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>fw', tb.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fd', tb.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>?', tb.keymaps, { desc = '[?] Find keymaps' })


