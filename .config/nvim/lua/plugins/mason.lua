return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "black",
      "rust-analyzer",
    },
    ui = {
      border = 'rounded'
    }
  },
}
