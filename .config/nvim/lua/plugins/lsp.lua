return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- pyright = {},
      emmet_language_server = {
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
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
