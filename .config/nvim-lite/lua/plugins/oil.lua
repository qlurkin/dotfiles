return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["<esc>"] = { "actions.close", mode = "n" },
    },
    float = {
      border = "rounded",
      preview_split = "right"
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
