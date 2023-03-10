return {
  "folke/noice.nvim",
  opts = function (_, opts)
    opts.cmdline = {
      format = {
        cmdline = { icon = ":" }
      }
    }
  end
}
