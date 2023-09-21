return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', "<leader><leader>", function () builtin.find_files({no_ignore = true}) end, {desc = "Find Files"})
    vim.keymap.set('n', "<leader>ff", builtin.find_files, {desc = "Find Files"})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Grep"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Buffers"})
    vim.keymap.set('n', '<leader>dd', builtin.diagnostics, {desc = "All Diagnostics"})
  end
}
