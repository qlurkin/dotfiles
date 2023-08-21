return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    vim.keymap.set('n', '<leader>fr', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Find and Replace"
    })
  end
}
