return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    local wk = require("which-key")
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.register({
      d = { name = "+Diagnostics" },
      f = { name = "+Find" },
    }, { prefix = "<leader>" })
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = { spelling = true },
    window = {
      border = "rounded",
    }
  }
}
