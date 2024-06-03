return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {},
      wgsl_analyzer = {},
      emmet_language_server = {
        filetypes = {
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "svelte",
          "pug",
          "typescriptreact",
          "vue",
          "markdown",
        },
      },
    },
  },
}
