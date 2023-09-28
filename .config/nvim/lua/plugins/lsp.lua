return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "simrat39/rust-tools.nvim",
    init = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, _) end,
        },
      })
    end,
  },
  opts = {
    servers = {
      pyright = {},
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
      rust_analyzer = {},
    },
    setup = {
      rust_analyzer = function(_, _)
        return false -- Don't let lspconfig setup rust_analyzer. rust-tools will do it
      end,
    },
  },
}
