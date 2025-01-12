return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    delete_to_trash = true,
    keymaps = {},
  },
  keys = {
    {
      "-",
      function()
        local oil = require("oil")
        oil.open_float()
      end,
      mode = "n",
      desc = "Open parent directory",
    },
  },
}
