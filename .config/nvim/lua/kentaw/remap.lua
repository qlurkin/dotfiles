vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('x', ">", ">gv")
vim.keymap.set('x', "<", "<gv")
-- vim.keymap.set('n', "<C-h>", "<C-w>h")
-- vim.keymap.set('n', "<C-l>", "<C-w>l")
-- vim.keymap.set('n', "<C-j>", "<C-w>j")
-- vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set('n', "<leader>e", function () vim.cmd('Ex') end)
vim.keymap.set('n', "<leader>i", "<cmd> vsplit<cr>")
vim.keymap.set('n', "<leader>-", "<cmd> split<cr>")


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



