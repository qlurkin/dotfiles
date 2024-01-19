-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")
-- vim.keymap.del({ "n", "v" }, "<leader>cf")

vim.keymap.set("n", "éd", "[d", { desc = "Prev Diagnostic", remap = true })
vim.keymap.set("n", "èd", "]d", { desc = "Next Diagnostic", remap = true })

vim.keymap.set("n", "és", "[s", { desc = "Prev Misspelled Word", remap = true })
vim.keymap.set("n", "ès", "]s", { desc = "Next Misspelled Word", remap = true })

vim.keymap.set("n", "ée", "[e", { desc = "Prev Error", remap = true })
vim.keymap.set("n", "èe", "]e", { desc = "Next Error", remap = true })

vim.keymap.set("n", "éw", "[w", { desc = "Prev Warning", remap = true })
vim.keymap.set("n", "èw", "]w", { desc = "Next Warning", remap = true })

vim.keymap.set("n", "éb", "[b", { desc = "Prev Buffer", remap = true })
vim.keymap.set("n", "èb", "]b", { desc = "Next Buffer", remap = true })

vim.keymap.set("n", "éq", "[q", { desc = "Prev Quickfix", remap = true })
vim.keymap.set("n", "èq", "]q", { desc = "Next Quickfix", remap = true })

vim.keymap.set("n", "ét", "[t", { desc = "Prev Todo Comment", remap = true })
vim.keymap.set("n", "èt", "]t", { desc = "Next Todo Comment", remap = true })

-- floating terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
vim.keymap.set("n", "<c-enter>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-enter>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("n", "<c-t>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.del("n", "<C-/>")
vim.keymap.del("t", "<C-/>")
