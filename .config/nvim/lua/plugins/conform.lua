return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft.python = { "isort", "black" }
    opts.formatters_by_ft.javascript = { "prettier" }
  end,
}
