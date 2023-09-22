return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "emmet-language-server",
      "rust-analyzer",
      "pyright",
      -- "flake8",
    },
  },
}
