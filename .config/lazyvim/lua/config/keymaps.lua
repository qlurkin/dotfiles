-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "<leader>0", function()
  Snacks.picker.pick({
    title = "Super Picker",
    multi = { "buffers", "files", "grep" },
    regex = true,
    format = "file",
    show_empty = true,
    live = true,
    supports_live = true,
    matcher = {
      cwd_bonus = true,
      frecency = true,
      sort_empty = true,
    },
    transform = "unique_file",
  })
end, { desc = "Super Picker" })
