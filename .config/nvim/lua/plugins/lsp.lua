return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "wgsl-analyzer")
      table.insert(opts.ensure_installed, "css-lsp")
      table.insert(opts.ensure_installed, "emmet-language-server")
      table.insert(opts.ensure_installed, "slang")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.cssls = {}
      opts.servers.wgsl_analyzer = {}
      opts.servers.slangd = {
        settings = {
          slang = {
            inlayHints = {
              deducedTypes = true,
              parameterNames = true,
            },
          },
        },
      }
      opts.emmet_language_server = {
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
      }
    end,
  },
}
