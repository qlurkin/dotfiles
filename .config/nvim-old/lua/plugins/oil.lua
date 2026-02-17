return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    delete_to_trash = true,
    keymaps = {},
    float = {
      border = "rounded",
    },
  },
  keys = {
    {
      "-",
      function()
        local oil = require("oil")
        oil.open_float(nil, {
          preview = {},
        })
      end,
      mode = "n",
      desc = "Open parent directory",
    },
  },
}
