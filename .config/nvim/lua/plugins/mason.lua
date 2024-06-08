return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "wgsl-analyzer")
    table.insert(opts.ensure_installed, "css-lsp")
  end,
}
