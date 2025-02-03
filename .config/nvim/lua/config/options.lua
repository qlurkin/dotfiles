-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.conceallevel = 0
-- vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"
vim.opt.spelllang = "fr"
vim.opt.swapfile = false

vim.filetype.add({
  extension = {
    wgsl = "wgsl",
  },
})

vim.filetype.add({
  extension = {
    slang = "shaderslang",
  },
})
