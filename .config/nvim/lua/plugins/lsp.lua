return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.cssls = {}
    opts.servers.wgsl_analyzer = {}
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
  -- opts = {
  --   servers = {
  --     cssls = {},
  --     wgsl_analyzer = {},
  --     emmet_language_server = {
  --       filetypes = {
  --         "eruby",
  --         "html",
  --         "javascript",
  --         "javascriptreact",
  --         "svelte",
  --         "pug",
  --         "typescriptreact",
  --         "vue",
  --         "markdown",
  --       },
  --     },
  --   },
  -- },
}
